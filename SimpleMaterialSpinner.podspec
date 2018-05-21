#
# Be sure to run `pod lib lint SimpleMaterialSpinner.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SimpleMaterialSpinner'
  s.version          = '0.8'
  s.summary          = "Simple loader like Google's Material loader."
  s.description      = <<-DESC
SimpleMaterialSpinner is a beautiful and simple loader that mimicks Google's Material loader.
                       DESC

  s.homepage         = 'https://github.com/ilia3546/SimpleMaterialSpinner'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ilya Kharlamov' => 'ilia3546@me.com' }
  s.source           = { :git => 'https://github.com/ilia3546/SimpleMaterialSpinner.git', :tag => s.version.to_s }

  s.swift_version = '4.0'
  s.ios.deployment_target = '8.0'

  s.source_files = 'SimpleMaterialSpinner/Classes/**/*'
  
end
