# SimpleMaterialSpinner <img align="left" height=35 src="https://github.com/ilia3546/SimpleMaterialSpinner/raw/assets/project-icon.gif">
SimpleMaterialSpinner is a beautiful and simple loader that mimicks Google's Material loader.

[![Language](https://img.shields.io/badge/Swift-4-orange.svg)]()
[![Version](https://img.shields.io/cocoapods/v/SimpleMaterialSpinner.svg?style=flat)](https://cocoapods.org/pods/SimpleMaterialSpinner)
[![License](https://img.shields.io/cocoapods/l/SimpleMaterialSpinner.svg?style=flat)](https://cocoapods.org/pods/SimpleMaterialSpinner)
[![Platform](https://img.shields.io/cocoapods/p/SimpleMaterialSpinner.svg?style=flat)](https://cocoapods.org/pods/SimpleMaterialSpinner)

## Features
- [x] Directly added to the iOS Interface Builder, very easy to integrate into every project! 😏
- [x] It can change color after every iteration
- [x] Customize line width, duration, etc.

##### How to use
```
//Customize
spinner.color1 = .red // First color
spinner.color2 = .green // Second color
spinner.color3 = nil // You can pass color
spinner.hidesWhenStopped = true
spinner.duration = 0.8
spinner.lineWidth = 4.0

//Start animating
spinner.startAnimating()

//Stop animating
spinner.stopAnimating()
```

## Requirements
- iOS 8.0+
- Xcode 8+

## CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate SimpleMaterialSpinner into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'SimpleMaterialSpinner'
```

Then, run the following command:

```bash
$ pod install
```


## Author

Ilya Kharlamov, ilia3546@me.com

## License

SimpleMaterialSpinner is available under the MIT license. See the LICENSE file for more info.

