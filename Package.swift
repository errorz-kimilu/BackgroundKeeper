// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "BackgroundKeeper",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "BackgroundKeeper",
            targets: ["BackgroundKeeper"]),
    ],
    targets: [
        .target(
            name: "BackgroundKeeper",
            resources: [
                .process("Resources/silence.mp3")
            ]),
    ]
)
