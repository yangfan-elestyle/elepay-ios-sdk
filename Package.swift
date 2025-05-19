// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ElepayiOSSDK",
  products: [
    .library(name: "ElepaySDK", targets: ["_ElepaySDK"]),
    .library(name: "ElepayRPayPlugin", targets: ["_ElepayRPayPlugin"]),
    .library(name: "Elepay_ChinesePayments_Plugin", targets: ["_Elepay_ChinesePayments_Plugin"]),
    .library(name: "ElepayStripePlugin", targets: ["_ElepayStripePlugin"]),
    .library(name: "ElepayStripeApplePayPlugin", targets: ["_ElepayStripeApplePayPlugin"]),
  ],
  targets: [
    .target(name: "_ElepaySDK", dependencies: ["ElepayCore", "ElepaySDK"]),
    .target(name: "_Elepay_ChinesePayments_Plugin", dependencies: ["ElepayCore", "Elepay_ChinesePayments_Plugin"]),
    .target(name: "_ElepayRPayPlugin", dependencies: ["ElepayCore", "ElepayRPayPlugin"]),
    .target(name: "_ElepayStripePlugin", dependencies: ["ElepayCore", "_Stripe", "ElepayStripePlugin"]),
    .target(name: "_ElepayStripeApplePayPlugin", dependencies: ["ElepayCore", "_StripeApplePay", "ElepayStripeApplePayPlugin"]),

    .binaryTarget(name: "ElepayCore", path: "xcframework/elepay/ElepayCore.xcframework.zip"),
    .binaryTarget(name: "ElepaySDK", path: "xcframework/elepay/ElepaySDK.xcframework.zip"),
    .binaryTarget(name: "ElepayStripePlugin", path: "xcframework/elepay-plugins/ElepayStripePlugin.xcframework.zip"),
    .binaryTarget(name: "ElepayStripeApplePayPlugin", path: "xcframework/elepay-plugins/ElepayStripeApplePayPlugin.xcframework.zip"),
    .binaryTarget(name: "ElepayRPayPlugin", path: "xcframework/elepay-plugins/ElepayRPayPlugin.xcframework.zip"),
    .binaryTarget(name: "Elepay_ChinesePayments_Plugin", path: "xcframework/elepay-plugins/Elepay_ChinesePayments_Plugin.xcframework.zip"),

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
