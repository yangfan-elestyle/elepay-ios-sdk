// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


/*
ElepayCore.xcframework.zip: 3e35c0c0c7f5d6859468ec4e91509a6cd9d35c57b814f76b29f264eb857f9584
ElepaySDK.xcframework.zip: f28ce2f9dd36866958709e7a71b4a76e1b0bdd108bf0b1f9fc6c5ed930e385b3
ElepayStripeApplePayPlugin.xcframework.zip: d353a59aa86bbad9a6df78bd92e2654c441570eb26a8af938b7bb27d8ef5cbc7
ElepayStripePlugin.xcframework.zip: 58c2162cd887a20fb4104685773fa4c0392390a535ecd0f6c67c57912388968e
ElepayChinesePaymentsPlugin.xcframework.zip: e0a0dbf01635548413d8c3dc51b5f967792fab61e852df46084937abb157f59d
ElepayRPayPlugin.xcframework.zip: bd4dde553b20201f92de2b680440439485be7cbe6743a96f920929f5ae655a55
*/

let version = "1.0.3"
let elepayRemoteUrl = "https://github.com/yangfan-elestyle/elepay-ios-sdk/releases/download/\(version)"

let package = Package(
  name: "ElepayiOSSDK",
  products: [
    .library(name: "ElepaySDK", targets: ["_ElepaySDK"]),
    .library(name: "ElepayRPayPlugin", targets: ["_ElepayRPayPlugin"]),
    .library(name: "ElepayChinesePaymentsPlugin", targets: ["_ElepayChinesePaymentsPlugin"]),
    .library(name: "ElepayStripePlugin", targets: ["_ElepayStripePlugin"]),
    .library(name: "ElepayStripeApplePayPlugin", targets: ["_ElepayStripeApplePayPlugin"]),
  ],
  targets: [
    .target(name: "_ElepaySDK", dependencies: ["ElepayCore", "ElepaySDK"]),
    .target(name: "_ElepayChinesePaymentsPlugin", dependencies: ["ElepayCore", "ElepayChinesePaymentsPlugin"]),
    .target(name: "_ElepayRPayPlugin", dependencies: ["ElepayCore", "ElepayRPayPlugin"]),
    .target(name: "_ElepayStripePlugin", dependencies: ["ElepayCore", "_Stripe", "ElepayStripePlugin"]),
    .target(name: "_ElepayStripeApplePayPlugin", dependencies: ["ElepayCore", "_StripeApplePay", "ElepayStripeApplePayPlugin"]),

    .binaryTarget(name: "ElepayCore", url: "\(elepayRemoteUrl)/ElepayCore.xcframework.zip", checksum: "3e35c0c0c7f5d6859468ec4e91509a6cd9d35c57b814f76b29f264eb857f9584"),
    .binaryTarget(name: "ElepaySDK", url: "\(elepayRemoteUrl)/ElepaySDK.xcframework.zip", checksum: "f28ce2f9dd36866958709e7a71b4a76e1b0bdd108bf0b1f9fc6c5ed930e385b3"),
    .binaryTarget(name: "ElepayStripePlugin", url: "\(elepayRemoteUrl)/ElepayStripePlugin.xcframework.zip", checksum: "58c2162cd887a20fb4104685773fa4c0392390a535ecd0f6c67c57912388968e"),
    .binaryTarget(name: "ElepayStripeApplePayPlugin", url: "\(elepayRemoteUrl)/ElepayStripeApplePayPlugin.xcframework.zip", checksum: "d353a59aa86bbad9a6df78bd92e2654c441570eb26a8af938b7bb27d8ef5cbc7"),
    .binaryTarget(name: "ElepayRPayPlugin", url: "\(elepayRemoteUrl)/ElepayRPayPlugin.xcframework.zip", checksum: "bd4dde553b20201f92de2b680440439485be7cbe6743a96f920929f5ae655a55"),
    .binaryTarget(name: "ElepayChinesePaymentsPlugin", url: "\(elepayRemoteUrl)/ElepayChinesePaymentsPlugin.xcframework.zip", checksum: "e0a0dbf01635548413d8c3dc51b5f967792fab61e852df46084937abb157f59d"),

    // Stripe targets
    .target(
      name: "_Stripe",
      dependencies: [
        "Stripe",
        "Stripe3DS2",
        "StripeCore",
        "StripeApplePay",
        "StripeUICore",
        "StripePayments",
        "StripePaymentsUI",
      ]
    ),
    .target(
      name: "_StripeApplePay",
      dependencies: [
        "StripeCore",
        "StripeApplePay",
      ]
    ),

    .binaryTarget(name: "Stripe", path: "xcframework/stripe/Stripe.xcframework.zip"),
    .binaryTarget(name: "StripeCore", path: "xcframework/stripe/StripeCore.xcframework.zip"),
    .binaryTarget(name: "StripeApplePay", path: "xcframework/stripe/StripeApplePay.xcframework.zip"),
    .binaryTarget(name: "StripePayments", path: "xcframework/stripe/StripePayments.xcframework.zip"),
    .binaryTarget(name: "StripePaymentsUI", path: "xcframework/stripe/StripePaymentsUI.xcframework.zip"),
    .binaryTarget(name: "StripePaymentSheet", path: "xcframework/stripe/StripePaymentSheet.xcframework.zip"),
    .binaryTarget(name: "StripeIdentity", path: "xcframework/stripe/StripeIdentity.xcframework.zip"),
    .binaryTarget(name: "StripeCardScan", path: "xcframework/stripe/StripeCardScan.xcframework.zip"),
    .binaryTarget(name: "StripeFinancialConnections", path: "xcframework/stripe/StripeFinancialConnections.xcframework.zip"),
    .binaryTarget(name: "StripeConnect", path: "xcframework/stripe/StripeConnect.xcframework.zip"),
    .binaryTarget(name: "Stripe3DS2", path: "xcframework/stripe/Stripe3DS2.xcframework.zip"),
    .binaryTarget(name: "StripeUICore", path: "xcframework/stripe/StripeUICore.xcframework.zip"),
    .binaryTarget(name: "StripeCameraCore", path: "xcframework/stripe/StripeCameraCore.xcframework.zip"),
  ]
)
