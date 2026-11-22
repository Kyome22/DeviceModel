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

### Display Cutout

`displayCutout` tells whether the display has a camera cutout.
`.notch` is a cutout attached to the top edge, and `.punchHole` is a cutout surrounded by the display on all sides.
It returns `nil` when the display has no cutout.

```swift
import DeviceModel

switch DeviceModel.current()?.displayCutout {
case .notch:
    print("Notch")
case .punchHole:
    print("Punch hole")
case nil:
    print("No cutout")
}
```

On iOS Simulator, `DeviceModel.current()` returns the simulated device model.
