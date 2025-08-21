Pod::Spec.new do |s|
  s.name             = 'ElepayCheckoutPlugin'
  s.version          = '5.0.2'
  s.summary          = 'Elepay Checkout Plugin for ElepaySDK. Integrates Checkout payment processing.'
  s.description      = <<-DESC
                         The Elepay iOS SDK makes it easy to build a stable and secure multi-channel payment experience in your iOS app.
                         We provide powerful SDK to support multi-payment methods like Credit Card, PayPay, LINE Pay, Paidly, PayPal, Alipay, WeChat Pay, etc.
                         All you need to do is install it once,
                         then you can satisfy your customers's cashless payment requirement coming from all around the world.
                         DESC
  s.homepage         = 'https://www.elepay.io'
  s.license          = { :type => "Copyright", :text => "Copyright ELESTYLE, Inc. All Rights Reserved." }
  s.author           = { "ELESTYLE, Inc." => "info@elestyle.jp" }
  s.source           = { :http => "https://github.com/yangfan-elestyle/elepay-ios-sdk/releases/download/5.0.2/ElepayCheckoutPlugin.xcframework.zip", :sha256 => "ef9a78762036d2e7cdbdd34a245e45cc2bb7568c82155e1b862853a5307d1786" }

  
  s.platform         = :ios, "13.0"
  s.swift_versions   = ['5.10']

  s.dependency 'ElepayCore'
  s.dependency 'ElepaySDK'

  s.vendored_frameworks = 'ElepayCheckoutPlugin.xcframework'

  s.requires_arc = true

end 
