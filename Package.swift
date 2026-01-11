// swift-tools-version: 6.2

import PackageDescription

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("ExistentialAny"),
]

let package = Package(
    name: "DeviceModel",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "DeviceModel",
            targets: ["DeviceModel"]
        ),
    ],
    targets: [
        .target(
            name: "DeviceModel",
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "DeviceModelTests",
            dependencies: ["DeviceModel"],
            swiftSettings: swiftSettings
        )
    ]
)
