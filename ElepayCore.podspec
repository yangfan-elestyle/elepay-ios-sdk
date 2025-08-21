Pod::Spec.new do |s|
  s.name         = 'ElepayCore'
  s.version      = '5.0.2' # Version from Package.swift for Elepay binaries
  s.summary      = 'Core component for Elepay iOS SDK.'
  s.description  = <<-DESC
                         The Elepay iOS SDK makes it easy to build a stable and secure multi-channel payment experience in your iOS app.
                         We provide powerful SDK to support multi-payment methods like Credit Card, PayPay, LINE Pay, Paidly, PayPal, Alipay, WeChat Pay, etc.
                         All you need to do is install it once,
                         then you can satisfy your customers's cashless payment requirement coming from all around the world.
                         DESC
  s.homepage     = 'https://www.elepay.io'
  s.license      = { :type => "Copyright", :text => "Copyright ELESTYLE, Inc. All Rights Reserved." }
  s.author       = { "ELESTYLE, Inc." => "info@elestyle.jp" }
  s.source       = { :http => "https://github.com/yangfan-elestyle/elepay-ios-sdk/releases/download/5.0.2/ElepayCore.xcframework.zip", :sha256 => "bd57ee07d839b1154e8f9e48e77ab8d659481d55dc2d40a968847cf0e6cd5ff2" }

  s.platform     = :ios, "13.0"
  s.swift_versions = ['5.9']

  s.vendored_frameworks = 'ElepayCore.xcframework'
  s.requires_arc = true
end 
