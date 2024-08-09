// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftJQ",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12),
        .watchOS(.v3),
        .tvOS(.v10)
    ],
    products: [
        .library(
            name: "SwiftJQ",
            targets: ["SwiftJQ"]),
    ],
    targets: [
        .target(
            name: "SwiftJQ",
            dependencies: ["Cjq", "Coniguruma"]),
        .testTarget(
            name: "SwiftJQTests",
            dependencies: ["SwiftJQ"],
            resources: [.process("Resources")]),
        .binaryTarget(
            name: "Cjq",
            url: "https://github.com/Sameesunkaria/JQ-Darwin/releases/download/2.0.0/Cjq.xcframework.zip",
            checksum: "468fd3455df87118741760c1144dfc3258dc025c649e9340c72d6f77383d346c"),
        .binaryTarget(
            name: "Coniguruma",
            url: "https://github.com/Sameesunkaria/JQ-Darwin/releases/download/2.0.0/Coniguruma.xcframework.zip",
            checksum: "5e093ab28cc2e11847f6091fe5a9f05c58c87c701602a8e7f87ae40fdc5c2fd9"),
    ]
)

import Foundation

// Temporary workaround so builds on watchOS pass.
// watchOS will support XCTest with Xcode 12.5.
if ProcessInfo.processInfo.environment["DISABLE_TESTS"] == "true" {
    package.targets.removeAll(where: \.isTest)
}
