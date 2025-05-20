Pod::Spec.new do |s|
  s.name             = 'ElepayStripePlugin'
  s.version          = '1.0.8'
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
  s.source           = { :http => "https://github.com/yangfan-elestyle/elepay-ios-sdk/releases/download/1.0.8/ElepayStripePlugin.xcframework.zip", :sha256 => "58c2162cd887a20fb4104685773fa4c0392390a535ecd0f6c67c57912388968e" }

  s.platform         = :ios, "13.0"
  s.swift_versions   = ['5.9']

  s.dependency 'ElepaySDK'

  s.dependency 'StripeCore', { :podspec => 'https://raw.githubusercontent.com/yangfan-elestyle/elestyle-stripe-ios/24.13.2/StripeCore.podspec' }
  s.dependency 'Stripe', { :podspec => 'https://raw.githubusercontent.com/yangfan-elestyle/elestyle-stripe-ios/24.13.2/Stripe.podspec' }
  s.dependency 'StripeApplePay', { :podspec => 'https://raw.githubusercontent.com/yangfan-elestyle/elestyle-stripe-ios/24.13.2/StripeApplePay.podspec' }
  s.dependency 'Stripe3DS2', { :podspec => 'https://raw.githubusercontent.com/yangfan-elestyle/elestyle-stripe-ios/24.13.2/Stripe3DS2.podspec' }
  s.dependency 'StripeUICore', { :podspec => 'https://raw.githubusercontent.com/yangfan-elestyle/elestyle-stripe-ios/24.13.2/StripeUICore.podspec' }
  s.dependency 'StripePayments', { :podspec => 'https://raw.githubusercontent.com/yangfan-elestyle/elestyle-stripe-ios/24.13.2/StripePayments.podspec' }
  s.dependency 'StripePaymentsUI', { :podspec => 'https://raw.githubusercontent.com/yangfan-elestyle/elestyle-stripe-ios/24.13.2/StripePaymentsUI.podspec' }

  s.vendored_frameworks = 'ElepayStripePlugin.xcframework'
  s.requires_arc = true

end 