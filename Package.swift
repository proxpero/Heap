// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Heap",
    products: [
        .library(
            name: "Heap",
            targets: ["Heap"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Heap",
            dependencies: []
        ),
        .testTarget(
            name: "HeapTests",
            dependencies: ["Heap"]
        ),
    ]
)
