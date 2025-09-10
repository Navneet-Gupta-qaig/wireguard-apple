// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QSleeve",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v17)
    ],
    products: [
        .library(name: "QSleeve", targets: ["QSleeveKit"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "QSleeveKit",
            dependencies: ["QSleeveKitGo", "QSleeveKitC"]
        ),
        .target(
            name: "QSleeveKitC",
            dependencies: [],
            publicHeadersPath: "."
        ),
        .target(
            name: "QSleeveKitGo",
            dependencies: [],
            exclude: [
                "goruntime-boottime-over-monotonic.diff",
                "go.mod",
                "go.sum",
                "api-apple.go",
                "Makefile"
            ],
            publicHeadersPath: ".",
            linkerSettings: [.linkedLibrary("wg-go")]
        )
    ]
)
