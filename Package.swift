import PackageDescription

let package = Package(
    name: "SwiftYAML",
    targets: [
        Target(name: "SwiftYAML", dependencies: ["libyaml"]),
    ]
)
