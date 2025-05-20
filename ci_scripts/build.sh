#!/usr/bin/env bash

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
PROJECT_ROOT=$(dirname "$SCRIPT_DIR")

OUTPUT_DIR="$PROJECT_ROOT/Output"
STRIPE_VENDOR_DIR="$PROJECT_ROOT/StripeVendor"

RELEASE_DIR="$PROJECT_ROOT/release"
SUM_FILE="$RELEASE_DIR/sum.txt"

mkdir -p "$RELEASE_DIR"

find "$OUTPUT_DIR" -name "*.zip" -exec cp {} "$RELEASE_DIR/" \; 2>/dev/null
find "$STRIPE_VENDOR_DIR" -name "*.zip" -exec cp {} "$RELEASE_DIR/" \; 2>/dev/null

find "$RELEASE_DIR" -maxdepth 1 -name "*.zip" -exec unzip -q -o {} -d "$RELEASE_DIR" -x "__MACOSX/*" \; 2>/dev/null

(cd "$RELEASE_DIR" && zip -q -r ElepayStripeApplePayPlugin-pods.xcframework.zip \
    ElepayStripeApplePayPlugin.xcframework \
    StripeCore.xcframework \
    StripeApplePay.xcframework)

(cd "$RELEASE_DIR" && zip -q -r ElepayStripePlugin-pods.xcframework.zip \
    ElepayStripePlugin.xcframework \
    Stripe.xcframework \
    Stripe3DS2.xcframework \
    StripeCore.xcframework \
    StripeApplePay.xcframework \
    StripeUICore.xcframework \
    StripePayments.xcframework \
    StripePaymentsUI.xcframework)

(cd "$RELEASE_DIR" && find . -mindepth 1 -maxdepth 1 ! -name "*.zip" -exec rm -rf {} + 2>/dev/null)

> "$SUM_FILE"

(cd "$RELEASE_DIR" && \
    find . -maxdepth 1 -name "*.zip" -print0 | while IFS= read -r -d $'\0' zip_file; do \
        local_zip_file=$(basename "$zip_file")
        checksum=$(swift package compute-checksum "$local_zip_file")
        echo "$local_zip_file: $checksum" >> "$SUM_FILE"
    done)

# ============== Update Cocoapods Podspec ==============

VERSION=$(cat "$PROJECT_ROOT/VERSION")

update_podspec_from_template() {
    base_name=$1
    zip_file=$2
    
    template_file="$PROJECT_ROOT/${base_name}.template"
    podspec_file="$PROJECT_ROOT/${base_name}"
    
    if [ ! -f "$template_file" ]; then
        return 1
    fi
    
    checksum=$(grep "$zip_file:" "$SUM_FILE" | cut -d: -f2 | tr -d ' ')
    
    if [ -n "$checksum" ]; then
        content=$(cat "$template_file")
        content="${content//<version>/$VERSION}"
        content="${content//<sha256>/$checksum}"
        echo "$content" > "$podspec_file"
    else
        echo "Error: Cannot find checksum for $zip_file"
    fi
}

update_podspec_from_template "ElepayChinesePaymentsPlugin.podspec" "ElepayChinesePaymentsPlugin.xcframework.zip"
update_podspec_from_template "ElepayStripePlugin.podspec" "ElepayStripePlugin-pods.xcframework.zip"
update_podspec_from_template "ElepayStripeApplePayPlugin.podspec" "ElepayStripeApplePayPlugin-pods.xcframework.zip"
update_podspec_from_template "ElepayRPayPlugin.podspec" "ElepayRPayPlugin.xcframework.zip"
update_podspec_from_template "ElepaySDK.podspec" "ElepaySDK.xcframework.zip"
update_podspec_from_template "ElepayCore.podspec" "ElepayCore.xcframework.zip"

# ============== Update Swift Package ==============

update_swift_package() {
    template_file="$PROJECT_ROOT/Package.swift.template"
    package_file="$PROJECT_ROOT/Package.swift"
    
    content=$(cat "$template_file")
    content="${content//<version>/$VERSION}"
    
    replace_checksum() {
        local zip_file="$1"
        local placeholder="$2"
        local checksum=$(grep "$zip_file:" "$SUM_FILE" | cut -d: -f2 | tr -d ' ')
        
        if [ -n "$checksum" ]; then
            content="${content//$placeholder/$checksum}"
        else
            echo "Warning: Cannot find checksum for $zip_file"
        fi
    }
    
    # Elepay组件校验和
    replace_checksum "ElepayCore.xcframework.zip" "<ElepayCore_sha256>"
    replace_checksum "ElepaySDK.xcframework.zip" "<ElepaySDK_sha256>"
    replace_checksum "ElepayStripePlugin.xcframework.zip" "<ElepayStripePlugin_sha256>"
    replace_checksum "ElepayStripeApplePayPlugin.xcframework.zip" "<ElepayStripeApplePayPlugin_sha256>"
    replace_checksum "ElepayRPayPlugin.xcframework.zip" "<ElepayRPayPlugin_sha256>"
    replace_checksum "ElepayChinesePaymentsPlugin.xcframework.zip" "<ElepayChinesePaymentsPlugin_sha256>"
    
    # Stripe组件校验和
    replace_checksum "Stripe.xcframework.zip" "<Stripe_sha256>"
    replace_checksum "StripeCore.xcframework.zip" "<StripeCore_sha256>"
    replace_checksum "StripeApplePay.xcframework.zip" "<StripeApplePay_sha256>"
    replace_checksum "StripePayments.xcframework.zip" "<StripePayments_sha256>"
    replace_checksum "StripePaymentsUI.xcframework.zip" "<StripePaymentsUI_sha256>"
    replace_checksum "StripePaymentSheet.xcframework.zip" "<StripePaymentSheet_sha256>"
    replace_checksum "StripeIdentity.xcframework.zip" "<StripeIdentity_sha256>"
    replace_checksum "StripeCardScan.xcframework.zip" "<StripeCardScan_sha256>"
    replace_checksum "StripeFinancialConnections.xcframework.zip" "<StripeFinancialConnections_sha256>"
    replace_checksum "StripeConnect.xcframework.zip" "<StripeConnect_sha256>"
    replace_checksum "Stripe3DS2.xcframework.zip" "<Stripe3DS2_sha256>"
    replace_checksum "StripeUICore.xcframework.zip" "<StripeUICore_sha256>"
    replace_checksum "StripeCameraCore.xcframework.zip" "<StripeCameraCore_sha256>"
    
    echo "$content" > "$package_file"
}

update_swift_package
