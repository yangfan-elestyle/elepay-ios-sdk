// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "5.0.3"
let r = "https://github.com/yangfan-elestyle/elepay-ios-sdk/releases/download/\(version)"

let __ElepayCore = "a1e7b0f4c69109571d483debb770b574a063a013f1ba947dd801e785c91b4d3f"
let __ElepaySDK = "b6418e510ef32247364dfee8fa50431c034c345a0fd88836d182ad45920cb077"
let __ElepayStripePlugin = "f8392381c6066435e590fb70a18539f0d50c426e28544df027eb1d85c4184a17"
let __ElepayStripeApplePayPlugin = "46dc9cc440b574bcf69308070f6cb280a46610b12e326f4326dca16f187362f6"
let __ElepayRPayPlugin = "305036fe0b474a26502b336081458f9c57d1ce514dfd9a4389ed419893e43195"
let __ElepayChinesePaymentsPlugin = "a7bacb3729e5eb1b05eb593f09a9ca052505943ede9640780584af2f9592d140"
let __ElepayCheckoutPlugin = "97f462dff91f8e796ecdd6deacfa432e19c9eed85c6dc52c011cb5d91b8508b2"

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
