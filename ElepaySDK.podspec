Pod::Spec.new do |s|
  s.name             = 'ElepaySDK'
  s.version          = '5.0.3'
  s.summary          = 'Elepay iOS SDK makes it easy to build a stable and secure multi-channel payment experience in your iOS app.'
  s.description      = <<-DESC
                         The Elepay iOS SDK makes it easy to build a stable and secure multi-channel payment experience in your iOS app.
                         We provide powerful SDK to support multi-payment methods like Credit Card, PayPay, LINE Pay, Paidly, PayPal, Alipay, WeChat Pay, etc.
                         All you need to do is install it once,
                         then you can satisfy your customers's cashless payment requirement coming from all around the world.
                         DESC
  s.homepage         = 'https://www.elepay.io'
  s.license          = { :type => "Copyright", :text => "Copyright ELESTYLE, Inc. All Rights Reserved." }
  s.author           = { "ELESTYLE, Inc." => "info@elestyle.jp" }
  s.source           = { :http => "https://github.com/yangfan-elestyle/elepay-ios-sdk/releases/download/5.0.3/ElepaySDK.xcframework.zip", :sha256 => "b6418e510ef32247364dfee8fa50431c034c345a0fd88836d182ad45920cb077" }

  s.platform         = :ios, "13.0"
  s.swift_versions   = ['5.10']

  s.vendored_frameworks = 'ElepaySDK.xcframework'
  
  s.dependency 'ElepayCore'

  s.requires_arc = true
end 
