# DeviceModel

This provides API to get the model ID and name of devices (Mac, iPhone, and iPad).

## Requirements

- Development with Xcode 26.1+
- Written in Swift 6.2
- Compatible with macOS 14.0+, iOS 17.0+

## Usage

```swift
import DeviceModel

if let deviceModel = DeviceModel.current() {
    print(deviceModel.name) // "Mac mini (M4 2024)"
}
```
