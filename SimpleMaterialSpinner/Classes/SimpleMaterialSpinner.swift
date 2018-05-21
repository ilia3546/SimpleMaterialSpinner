import UIKit

public class SimpleMaterialSpinner: UIView {
    
    // MARK: - Properties
    fileprivate let infinity: Float = 1.0/0.0
    fileprivate var contentView: UIView!
    fileprivate var shapeLayer: CAShapeLayer!
    fileprivate var currentAnimation = 0
    fileprivate var timer: Timer?
    fileprivate var colors: [UIColor] {
        return [color1, color2, color3].compactMap({ $0 })
    }
    
    @IBInspectable public var color1: UIColor? = .darkGray
    @IBInspectable public var color2: UIColor?
    @IBInspectable public var color3: UIColor?
    @IBInspectable public var duration: Double = 0.8
    @IBInspectable public var lineWidth: CGFloat = 4.0 {
        didSet{
            shapeLayer.lineWidth = lineWidth
        }
    }
    
    @IBInspectable public var hidesWhenStopped: Bool = true
    public var isAnimating = false
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    
    fileprivate func addViews(){
        
        contentView = UIView()
        addSubview(contentView)
        
        shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineJoinRound;
        shapeLayer.isHidden = true;
        
        contentView.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    override public func layoutSubviews() {
        
        let minSize = CGFloat.minimum(frame.width, frame.height)
        contentView.frame = CGRect(x: 0, y: 0, width: minSize, height: minSize)
        contentView.center = CGPoint(x: frame.width/2, y: frame.height/2)
        
        let radius: CGFloat = minSize / 2.0
        shapeLayer.frame = contentView.frame
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0 * radius, height: 2.0 * radius), cornerRadius: radius).cgPath
        
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        addViews()
    }
    
    // MARK: - Public Mathods
    public func startAnimating() {
        
        guard !isAnimating else { return }
        
        isAnimating = true
        
        let inAnimation = CAKeyframeAnimation(keyPath: "strokeEnd")
        inAnimation.duration = duration
        inAnimation.values = [0, 1]
        
        let outAnimation = CAKeyframeAnimation(keyPath: "strokeStart")
        outAnimation.duration = duration
        outAnimation.values = [0, 0.8, 1]
        outAnimation.beginTime = duration / 1.5;
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [inAnimation, outAnimation]
        groupAnimation.duration = duration + outAnimation.beginTime;
        groupAnimation.repeatCount = infinity;
        
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnim.fromValue = 0
        rotationAnim.toValue = Double.pi * 2
        rotationAnim.duration = duration * 1.5
        rotationAnim.repeatCount = infinity
        
        shapeLayer.strokeColor = colors.first?.cgColor ?? UIColor.red.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.add(rotationAnim, forKey: "rotation.z")
        shapeLayer.add(groupAnimation, forKey: nil)
        
        if colors.count > 1 {
            timer = Timer.scheduledTimer(timeInterval: duration + outAnimation.beginTime, target: self, selector: #selector(changeStrokeColor), userInfo: nil, repeats: true)
        }
        shapeLayer.isHidden = false
    }
    
    @objc fileprivate func changeStrokeColor() {
        currentAnimation += 1
        shapeLayer.strokeColor = colors[currentAnimation % colors.count].cgColor
    }
    
    public func stopAnimating() {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            // Nice fade and ride
            self.contentView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2);
            self.contentView.alpha = 0.0;
        }) { (finished) -> Void in
            self.isAnimating = false
            self.currentAnimation = 0
            if let timer = self.timer{
                timer.invalidate()
            }
            self.contentView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
            self.contentView.alpha = 1.0;
            self.shapeLayer.isHidden = self.hidesWhenStopped;
            self.shapeLayer.removeAllAnimations()
        }
    }
}
