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
            checksum: "a5f34778888d39651396ffa18456be6f9a4e4482"),
        .binaryTarget(
            name: "Coniguruma",
            url: "https://github.com/Sameesunkaria/JQ-Darwin/releases/download/2.0.0/Coniguruma.xcframework.zip",
            checksum: "83cbe07fa3e0869702723007668565a5304cb88c"),
    ]
)

import Foundation

// Temporary workaround so builds on watchOS pass.
// watchOS will support XCTest with Xcode 12.5.
if ProcessInfo.processInfo.environment["DISABLE_TESTS"] == "true" {
    package.targets.removeAll(where: \.isTest)
}
