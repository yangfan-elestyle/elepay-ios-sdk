Pod::Spec.new do |s|
  s.name             = 'ElepayStripePlugin'
  s.version          = '1.0.6'
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
  s.source           = { :http => "https://github.com/yangfan-elestyle/elepay-ios-sdk/releases/download/1.0.6/ElepayStripePlugin.xcframework.zip", :sha256 => "58c2162cd887a20fb4104685773fa4c0392390a535ecd0f6c67c57912388968e" }

  s.platform         = :ios, "13.0"
  s.swift_versions   = ['5.9']

  s.dependency 'ElepaySDK'

  s.vendored_frameworks = [
    'ElepayStripePlugin.xcframework',
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