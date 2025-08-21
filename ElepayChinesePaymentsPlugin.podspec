Pod::Spec.new do |s|
  s.name             = 'ElepayChinesePaymentsPlugin'
  s.version          = '5.0.2'
  s.summary          = 'Elepay Chinese Payments Plugin for ElepaySDK. Integrates Chinese payment methods like Alipay, WeChat Pay.'
  s.description      = <<-DESC
                         The Elepay iOS SDK makes it easy to build a stable and secure multi-channel payment experience in your iOS app.
                         We provide powerful SDK to support multi-payment methods like Credit Card, PayPay, LINE Pay, Paidly, PayPal, Alipay, WeChat Pay, etc.
                         All you need to do is install it once,
                         then you can satisfy your customers's cashless payment requirement coming from all around the world.
                         DESC
  s.homepage         = 'https://www.elepay.io'
  s.license          = { :type => "Copyright", :text => "Copyright ELESTYLE, Inc. All Rights Reserved." }
  s.author           = { "ELESTYLE, Inc." => "info@elestyle.jp" }
  s.source           = { :http => "https://github.com/yangfan-elestyle/elepay-ios-sdk/releases/download/5.0.2/ElepayChinesePaymentsPlugin.xcframework.zip", :sha256 => "0cf3fa86403bd345a0f12a6b8f0e12d95417a67b873cb2e635e07d689b834afa" }

  s.platform         = :ios, "13.0"
  s.swift_versions   = ['5.10']

  s.dependency 'ElepaySDK'

  s.vendored_frameworks = 'ElepayChinesePaymentsPlugin.xcframework'
  s.requires_arc = true

  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end 
