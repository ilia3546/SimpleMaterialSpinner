//
//  ViewController.swift
//  SimpleMaterialSpinner
//
//  Created by ilia3546@me.com on 05/21/2018.
//  Copyright (c) 2018 ilia3546@me.com. All rights reserved.
//

import UIKit
import SimpleMaterialSpinner

class ViewController: UIViewController {
    
    @IBOutlet weak var spinner: SimpleMaterialSpinner!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
    }

}

