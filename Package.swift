// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "LoopUITestingKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "LoopUITestingKit",
            targets: ["LoopUITestingKit"]),
    ],
    targets: [
        .target(
            name: "LoopUITestingKit")
    ]
)
