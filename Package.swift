// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "5.0.1"
let r = "https://github.com/yangfan-elestyle/elepay-ios-sdk/releases/download/\(version)"

let __ElepayCore = "e832a62236c8fcb15d54f12728629935e0f78a5a61dfe0dea17d2872ff788950"
let __ElepaySDK = "5775e897143b0366ac40d77ad5b314205cbcc70fbda4af46025d1e4a24ed3b50"
let __ElepayStripePlugin = "c0b887bfc88afd8b45b15dfbd2cd82c7f00d905fb6a81f99ecf484e496b814e7"
let __ElepayStripeApplePayPlugin = "7e726090a03e084f28d3a399bace6a2d4e4dbb93a4b06a45e0ac46cfa2ecaf9a"
let __ElepayRPayPlugin = "f4a939247e0a697aa282aeb1ffc20faceff8237467d0990ce15728bbfed71ba8"
let __ElepayChinesePaymentsPlugin = "6cf5ea72da0120e1ac472dbd5374dcc168dd2fcd3b1baef9c12d37b8875e2aa1"
let __ElepayCheckoutPlugin = "bf05076ab00c21321b29408116b967cf275c5993fb29481b71b66fd0a3e1f35c"

let __Stripe = "e12813e338eaea100a68642b62b04d25f3c5c39fd925b6a95f58c3fa0ad386fd"
let __StripeCore = "91f3e1ff0e6e82d64f75cf50ed3cce01e90c3a04e2fb1c75cac9f583210e34be"
let __StripeApplePay = "9786ed5b39a42fbd5123ba19aebc983729269555a555552d996896967e16905a"
let __StripePayments = "72ce13b7ab4c13d797caa6a3ad3464221907b7b80d64843bccc928a35ccca729"
let __StripePaymentsUI = "13f16742c11801656e5c607e03943ab90d33bfe136733002c2231c5c92d72402"  
let __StripePaymentSheet = "f46211b195cbf612e48c6136202c3587dce76750279cb9b16cadf85be2f107c4"
let __StripeIdentity = "9f50bc6c794a6a678d2ec4dabf1620f07f23c24280533c6fb942fc2b8470564a"
let __StripeCardScan = "624dd8970ad451452a85f8e341a289dddedb9b9a58ed1569209a59d8ab78a544"
let __StripeFinancialConnections = "d9ee20c1db4d813b0b21a3bffd60ffe33856f9547fa582a5f084b75e6c80dc34"
let __StripeConnect = "30ac6efca4d7bf243ae85fc9f7c3686ba32a0ab8df1e92e11102ba184816454a"
let __Stripe3DS2 = "31e0fb219f249a830b2b8d18afd24c9e84b626d9684e7e7f27eb9566cc0f340d"
let __StripeUICore = "88c0284dc08bf20674ce82a9838d09799859bf21ad0974499260668fa641f659"
let __StripeCameraCore = "c96b55cf499d308268c57f717bf4801f8b43d381ecedee8d878de9f3399d6af7"  

let package = Package(
  name: "ElepayiOSSDK",
  products: [
    .library(name: "ElepaySDK", targets: ["_ElepaySDK"]),
    .library(name: "ElepayRPayPlugin", targets: ["_ElepayRPayPlugin"]),
    .library(name: "ElepayChinesePaymentsPlugin", targets: ["_ElepayChinesePaymentsPlugin"]),
    .library(name: "ElepayStripePlugin", targets: ["_ElepayStripePlugin"]),
    .library(name: "ElepayStripeApplePayPlugin", targets: ["_ElepayStripeApplePayPlugin"]),
    .library(name: "ElepayCheckoutPlugin", targets: ["_ElepayCheckoutPlugin"]),
  ],
  targets: [
    .target(name: "_ElepaySDK", dependencies: ["ElepayCore", "ElepaySDK"]),
    .target(name: "_ElepayChinesePaymentsPlugin", dependencies: ["ElepayCore", "ElepayChinesePaymentsPlugin"]),
    .target(name: "_ElepayRPayPlugin", dependencies: ["ElepayCore", "ElepayRPayPlugin"]),
    .target(name: "_ElepayStripePlugin", dependencies: ["ElepayCore", "_Stripe", "ElepayStripePlugin"]),
    .target(name: "_ElepayStripeApplePayPlugin", dependencies: ["ElepayCore", "_StripeApplePay", "ElepayStripeApplePayPlugin"]),
    .target(name: "_ElepayCheckoutPlugin", dependencies: ["ElepayCore", "ElepaySDK", "ElepayCheckoutPlugin"]),

    .binaryTarget(name: "ElepayCore", url: "\(r)/ElepayCore.xcframework.zip", checksum: __ElepayCore),
    .binaryTarget(name: "ElepaySDK", url: "\(r)/ElepaySDK.xcframework.zip", checksum: __ElepaySDK),
    .binaryTarget(name: "ElepayStripePlugin", url: "\(r)/ElepayStripePlugin.xcframework.zip", checksum: __ElepayStripePlugin),
    .binaryTarget(name: "ElepayStripeApplePayPlugin", url: "\(r)/ElepayStripeApplePayPlugin.xcframework.zip", checksum: __ElepayStripeApplePayPlugin),
    .binaryTarget(name: "ElepayRPayPlugin", url: "\(r)/ElepayRPayPlugin.xcframework.zip", checksum: __ElepayRPayPlugin),
    .binaryTarget(name: "ElepayChinesePaymentsPlugin", url: "\(r)/ElepayChinesePaymentsPlugin.xcframework.zip", checksum: __ElepayChinesePaymentsPlugin),
    .binaryTarget(name: "ElepayCheckoutPlugin", url: "\(r)/ElepayCheckoutPlugin.xcframework.zip", checksum: __ElepayCheckoutPlugin),

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

    .binaryTarget(name: "Stripe", url: "\(r)/Stripe.xcframework.zip", checksum: __Stripe),
    .binaryTarget(name: "StripeCore", url: "\(r)/StripeCore.xcframework.zip", checksum: __StripeCore),
    .binaryTarget(name: "StripeApplePay", url: "\(r)/StripeApplePay.xcframework.zip", checksum: __StripeApplePay),
    .binaryTarget(name: "StripePayments", url: "\(r)/StripePayments.xcframework.zip", checksum: __StripePayments),
    .binaryTarget(name: "StripePaymentsUI", url: "\(r)/StripePaymentsUI.xcframework.zip", checksum: __StripePaymentsUI),
    .binaryTarget(name: "StripePaymentSheet", url: "\(r)/StripePaymentSheet.xcframework.zip", checksum: __StripePaymentSheet),
    .binaryTarget(name: "StripeIdentity", url: "\(r)/StripeIdentity.xcframework.zip", checksum: __StripeIdentity),
    .binaryTarget(name: "StripeCardScan", url: "\(r)/StripeCardScan.xcframework.zip", checksum: __StripeCardScan),
    .binaryTarget(name: "StripeFinancialConnections", url: "\(r)/StripeFinancialConnections.xcframework.zip", checksum: __StripeFinancialConnections),
    .binaryTarget(name: "StripeConnect", url: "\(r)/StripeConnect.xcframework.zip", checksum: __StripeConnect),
    .binaryTarget(name: "Stripe3DS2", url: "\(r)/Stripe3DS2.xcframework.zip", checksum: __Stripe3DS2),
    .binaryTarget(name: "StripeUICore", url: "\(r)/StripeUICore.xcframework.zip", checksum: __StripeUICore),
    .binaryTarget(name: "StripeCameraCore", url: "\(r)/StripeCameraCore.xcframework.zip", checksum: __StripeCameraCore),
  ]
)
