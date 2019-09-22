// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Word",
    products: [
        .library(
            name: "Word",
            targets: ["Word"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Word",
            dependencies: []
        ),
        .testTarget(
            name: "WordTests",
            dependencies: ["Word"]
        ),
    ]
)
