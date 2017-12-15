# LGTMKit
Get LGTM image from lgtm.in, written by swift

Inspired by [danger-lgtm](https://github.com/leonhartX/danger-lgtm).

## Install

### Swift Package Manager

Specifiy Dependency on your `Package.swift`.

```swift
let package = Package(
    name: "Dangerfile",
    products: [.library(name: "MarathonDependencies", type: .dynamic, targets: ["Dangerfile"])],
    dependencies: [
        .package(url: "https//github.com/d-date/LGTMKit.git")
    ],
    targets: [.target(name: "Dangerfile", dependencies: ["LGTMKit"])],
    swiftLanguageVersions: [4]
)
```

## Usage

Just written as below. Very easy 😎

```swift
import LGTMKit

LGTMKit.fetchImage() { (url) in
    print(url) // LGTM image url
}
```

If you want a https image only, you can use `httpsImageOnly` option

```swift
LGTMKit.fetchImage(httpsImageOnly: true) { (url) in
    print(url) // LGTM image url
}

```

## Contribution

1. Download this repo.
2. Run `swift package generate-xcodeproj`.
3. You can develop with your Xcode.
4. Commit your change. 
5. Make Pull Request.