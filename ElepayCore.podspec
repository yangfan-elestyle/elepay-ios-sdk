Pod::Spec.new do |s|
  s.name         = 'ElepayCore'
  s.version      = '1.0.8' # Version from Package.swift for Elepay binaries
  s.summary      = 'Core component for Elepay iOS SDK.'
  s.description  = <<-DESC
                   Core framework for the Elepay iOS SDK, providing essential functionalities.
                   DESC
  s.homepage     = 'https://www.elepay.io'
  s.license      = { :type => "Copyright", :text => "Copyright ELESTYLE, Inc. All Rights Reserved." }
  s.author       = { "ELESTYLE, Inc." => "info@elestyle.jp" }
  s.source       = { :http => "https://github.com/yangfan-elestyle/elepay-ios-sdk/releases/download/1.0.8/ElepayCore.xcframework.zip", :sha256 => "3e35c0c0c7f5d6859468ec4e91509a6cd9d35c57b814f76b29f264eb857f9584" }

  s.platform     = :ios, "13.0"
  s.swift_versions = ['5.9']

  s.vendored_frameworks = 'ElepayCore.xcframework'
  s.requires_arc = true
end 