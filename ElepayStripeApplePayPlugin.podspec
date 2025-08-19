Pod::Spec.new do |s|
  s.name             = 'ElepayStripeApplePayPlugin'
  s.version          = '5.0.1'
  s.summary          = 'Elepay Stripe Apple Pay Plugin for ElepaySDK. Integrates Apple Pay processing via Stripe.'
  s.description      = <<-DESC
                         The Elepay iOS SDK makes it easy to build a stable and secure multi-channel payment experience in your iOS app.
                         We provide powerful SDK to support multi-payment methods like Credit Card, PayPay, LINE Pay, Paidly, PayPal, Alipay, WeChat Pay, etc.
                         All you need to do is install it once,
                         then you can satisfy your customers's cashless payment requirement coming from all around the world.
                         DESC
  s.homepage         = 'https://www.elepay.io'
  s.license          = { :type => "Copyright", :text => "Copyright ELESTYLE, Inc. All Rights Reserved." }
  s.author           = { "ELESTYLE, Inc." => "info@elestyle.jp" }
  s.source           = { :http => "https://github.com/yangfan-elestyle/elepay-ios-sdk/releases/download/5.0.1/ElepayStripeApplePayPlugin-pods.xcframework.zip", :sha256 => "7b72d039f1b9f91f7ae689cd81416aa83f0fac5020049185d94269ae35e9c57f" }

  s.platform         = :ios, "13.0"
  s.swift_versions   = ['5.10']

  s.dependency 'ElepaySDK'

  s.vendored_frameworks = [
    'ElepayStripeApplePayPlugin.xcframework',
    'StripeCore.xcframework',
    'StripeApplePay.xcframework',
  ]

  s.requires_arc = true

end 
