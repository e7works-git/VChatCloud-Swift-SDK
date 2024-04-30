// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VChatCloudSwiftSDK",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15),
        .macCatalyst(.v15),
    ],
    products: [
        .library(
            name: "VChatCloudSwiftSDK",
            targets: ["VChatCloudSwiftSDK"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(name: "VChatCloudSwiftSDK", path: "./Frameworks/VChatCloudSwiftSDK.xcframework.zip"),
    ],
    swiftLanguageVersions: [
        .v5,
    ]
)
