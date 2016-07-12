import PackageDescription

let package = Package(
    name: "SwiftYAML",
    targets: [
        Target(name: "SwiftYAML", dependencies: ["libyaml"]),
    ]
    //dependencies: [.Package(url: "https://github.com/aciidb0mb3r/SwiftBasic", majorVersion: 1)]
)
