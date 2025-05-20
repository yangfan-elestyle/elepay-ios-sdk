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
/*
StripeUICore.xcframework.zip: 88c0284dc08bf20674ce82a9838d09799859bf21ad0974499260668fa641f659
StripePaymentsUI.xcframework.zip: 13f16742c11801656e5c607e03943ab90d33bfe136733002c2231c5c92d72402
StripePaymentSheet.xcframework.zip: f46211b195cbf612e48c6136202c3587dce76750279cb9b16cadf85be2f107c4
StripePayments.xcframework.zip: 72ce13b7ab4c13d797caa6a3ad3464221907b7b80d64843bccc928a35ccca729
StripeIdentity.xcframework.zip: 9f50bc6c794a6a678d2ec4dabf1620f07f23c24280533c6fb942fc2b8470564a
StripeFinancialConnections.xcframework.zip: d9ee20c1db4d813b0b21a3bffd60ffe33856f9547fa582a5f084b75e6c80dc34
StripeCore.xcframework.zip: 91f3e1ff0e6e82d64f75cf50ed3cce01e90c3a04e2fb1c75cac9f583210e34be
StripeCardScan.xcframework.zip: 624dd8970ad451452a85f8e341a289dddedb9b9a58ed1569209a59d8ab78a544
StripeConnect.xcframework.zip: 30ac6efca4d7bf243ae85fc9f7c3686ba32a0ab8df1e92e11102ba184816454a
StripeCameraCore.xcframework.zip: c96b55cf499d308268c57f717bf4801f8b43d381ecedee8d878de9f3399d6af7
StripeApplePay.xcframework.zip: 9786ed5b39a42fbd5123ba19aebc983729269555a555552d996896967e16905a
Stripe3DS2.xcframework.zip: 31e0fb219f249a830b2b8d18afd24c9e84b626d9684e7e7f27eb9566cc0f340d
Stripe.xcframework.zip: e12813e338eaea100a68642b62b04d25f3c5c39fd925b6a95f58c3fa0ad386fd
*/

let version = "1.0.3"
let elepayUrl = "https://github.com/yangfan-elestyle/elepay-ios-sdk/releases/download/\(version)"
let stripeUrl = "https://github.com/yangfan-elestyle/elestyle-stripe-ios/releases/download/24.13.1"

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

    .binaryTarget(name: "ElepayCore", url: "\(elepayUrl)/ElepayCore.xcframework.zip", checksum: "3e35c0c0c7f5d6859468ec4e91509a6cd9d35c57b814f76b29f264eb857f9584"),
    .binaryTarget(name: "ElepaySDK", url: "\(elepayUrl)/ElepaySDK.xcframework.zip", checksum: "f28ce2f9dd36866958709e7a71b4a76e1b0bdd108bf0b1f9fc6c5ed930e385b3"),
    .binaryTarget(name: "ElepayStripePlugin", url: "\(elepayUrl)/ElepayStripePlugin.xcframework.zip", checksum: "58c2162cd887a20fb4104685773fa4c0392390a535ecd0f6c67c57912388968e"),
    .binaryTarget(name: "ElepayStripeApplePayPlugin", url: "\(elepayUrl)/ElepayStripeApplePayPlugin.xcframework.zip", checksum: "d353a59aa86bbad9a6df78bd92e2654c441570eb26a8af938b7bb27d8ef5cbc7"),
    .binaryTarget(name: "ElepayRPayPlugin", url: "\(elepayUrl)/ElepayRPayPlugin.xcframework.zip", checksum: "bd4dde553b20201f92de2b680440439485be7cbe6743a96f920929f5ae655a55"),
    .binaryTarget(name: "ElepayChinesePaymentsPlugin", url: "\(elepayUrl)/ElepayChinesePaymentsPlugin.xcframework.zip", checksum: "e0a0dbf01635548413d8c3dc51b5f967792fab61e852df46084937abb157f59d"),

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

    .binaryTarget(name: "Stripe", url: "\(stripeUrl)/Stripe.xcframework.zip", checksum: "e12813e338eaea100a68642b62b04d25f3c5c39fd925b6a95f58c3fa0ad386fd"),
    .binaryTarget(name: "StripeCore", url: "\(stripeUrl)/StripeCore.xcframework.zip", checksum: "91f3e1ff0e6e82d64f75cf50ed3cce01e90c3a04e2fb1c75cac9f583210e34be"),
    .binaryTarget(name: "StripeApplePay", url: "\(stripeUrl)/StripeApplePay.xcframework.zip", checksum: "9786ed5b39a42fbd5123ba19aebc983729269555a555552d996896967e16905a"),
    .binaryTarget(name: "StripePayments", url: "\(stripeUrl)/StripePayments.xcframework.zip", checksum: "72ce13b7ab4c13d797caa6a3ad3464221907b7b80d64843bccc928a35ccca729"),
    .binaryTarget(name: "StripePaymentsUI", url: "\(stripeUrl)/StripePaymentsUI.xcframework.zip", checksum: "13f16742c11801656e5c607e03943ab90d33bfe136733002c2231c5c92d72402"),
    .binaryTarget(name: "StripePaymentSheet", url: "\(stripeUrl)/StripePaymentSheet.xcframework.zip", checksum: "f46211b195cbf612e48c6136202c3587dce76750279cb9b16cadf85be2f107c4"),
    .binaryTarget(name: "StripeIdentity", url: "\(stripeUrl)/StripeIdentity.xcframework.zip", checksum: "9f50bc6c794a6a678d2ec4dabf1620f07f23c24280533c6fb942fc2b8470564a"),
    .binaryTarget(name: "StripeCardScan", url: "\(stripeUrl)/StripeCardScan.xcframework.zip", checksum: "624dd8970ad451452a85f8e341a289dddedb9b9a58ed1569209a59d8ab78a544"),
    .binaryTarget(name: "StripeFinancialConnections", url: "\(stripeUrl)/StripeFinancialConnections.xcframework.zip", checksum: "d9ee20c1db4d813b0b21a3bffd60ffe33856f9547fa582a5f084b75e6c80dc34"),
    .binaryTarget(name: "StripeConnect", url: "\(stripeUrl)/StripeConnect.xcframework.zip", checksum: "30ac6efca4d7bf243ae85fc9f7c3686ba32a0ab8df1e92e11102ba184816454a"),
    .binaryTarget(name: "Stripe3DS2", url: "\(stripeUrl)/Stripe3DS2.xcframework.zip", checksum: "31e0fb219f249a830b2b8d18afd24c9e84b626d9684e7e7f27eb9566cc0f340d"),
    .binaryTarget(name: "StripeUICore", url: "\(stripeUrl)/StripeUICore.xcframework.zip", checksum: "88c0284dc08bf20674ce82a9838d09799859bf21ad0974499260668fa641f659"),
    .binaryTarget(name: "StripeCameraCore", url: "\(stripeUrl)/StripeCameraCore.xcframework.zip", checksum: "c96b55cf499d308268c57f717bf4801f8b43d381ecedee8d878de9f3399d6af7"),
  ]
)
