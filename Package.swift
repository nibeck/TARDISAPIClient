// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TARDISAPIClient",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "TARDISAPIClient",
            targets: ["TARDISAPIClient"]
        )
    ],
    dependencies: [
        // Code generator (PLUGIN ONLY)
        .package(
            url: "https://github.com/apple/swift-openapi-generator",
            from: "1.0.0"
        ),

        // Runtime support
        .package(
            url: "https://github.com/apple/swift-openapi-runtime",
            from: "1.0.0"
        ),

        // URLSession transport
        .package(
            url: "https://github.com/apple/swift-openapi-urlsession",
            from: "1.0.0"
        )
    ],
    targets: [
        .target(
            name: "TARDISAPIClient",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession")
            ]
            // Plugin removed to avoid duplicate filename errors since generated sources are checked in.
            /*
            plugins: [
                .plugin(
                    name: "OpenAPIGenerator",
                    package: "swift-openapi-generator"
                )
            ]
            */
        )
    ]
)
