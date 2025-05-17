Pod::Spec.new do |s|
  s.name             = 'ElepayStripePlugin'
  s.version          = '1.0.1'
  s.summary          = 'Elepay Stripe Plugin for ElepaySDK. Integrates Stripe payment processing.'
  s.description      = <<-DESC
                         The Elepay iOS SDK makes it easy to build a stable and secure multi-channel payment experience in your iOS app.
                         We provide powerful SDK to support multi-payment methods like Credit Card, PayPay, LINE Pay, Paidly, PayPal, Alipay, WeChat Pay, etc.
                         All you need to do is install it once,
                         then you can satisfy your customers's cashless payment requirement coming from all around the world.
                         DESC
  s.homepage         = 'https://www.elepay.io'
  s.license          = { :type => "Copyright", :text => "Copyright ELESTYLE, Inc. All Rights Reserved." }
  s.author           = { "ELESTYLE, Inc." => "info@elestyle.jp" }
  s.source           = { :git => 'https://github.com/elestyle/elepay-ios-sdk.git', :tag => s.version.to_s }

  s.platform         = :ios, "13.0"
  s.swift_versions   = ['5.9']

  s.dependency 'ElepaySDK'
  s.vendored_frameworks = [
    'xcframework/elepay-plugins/ElepayStripePlugin.xcframework',
    'xcframework/stripe/StripeCore.xcframework',
    'xcframework/stripe/Stripe.xcframework',
    'xcframework/stripe/StripeApplePay.xcframework',
    'xcframework/stripe/Stripe3DS2.xcframework',
    'xcframework/stripe/StripeUICore.xcframework',
    'xcframework/stripe/StripePayments.xcframework',
    'xcframework/stripe/StripePaymentsUI.xcframework'
  ]
  s.requires_arc = true

end 