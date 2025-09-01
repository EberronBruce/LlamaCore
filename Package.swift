// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "LlamaCore",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Expose the wrapper as the library product
        .library(
            name: "LlamaCore",
            targets: ["LlamaCoreWrapper"]
        )
    ],
    targets: [
        // Binary frameworks
        .binaryTarget(
            name: "LlamaCore",
            path: "Frameworks/LlamaCore.xcframework"
        ),
        .binaryTarget(
            name: "llama",
            path: "Frameworks/llama.xcframework"
        ),

        // Swift wrapper target
        .target(
            name: "LlamaCoreWrapper",
            dependencies: [
                .target(name: "LlamaCore"),
                .target(name: "llama")
            ]
        )
    ]
)
