import Foundation

typealias _Macintosh = Macintosh
typealias _iPhone = iPhone
typealias _iPad = iPad

public enum DeviceModel: Sendable {
    case Macintosh(Macintosh)
    case iPhone(iPhone)
    case iPad(iPad)

    public var rawValue: String {
        switch self {
        case let .Macintosh(value):
            value.rawValue
        case let .iPhone(value):
            value.rawValue
        case let .iPad(value):
            value.rawValue
        }
    }

    public var name: String {
        switch self {
        case let .Macintosh(value):
            value.name
        case let .iPhone(value):
            value.name
        case let .iPad(value):
            value.name
        }
    }

    public var displayCutout: DisplayCutout? {
        switch self {
        case let .Macintosh(value):
            value.displayCutout
        case let .iPhone(value):
            value.displayCutout
        case .iPad:
            nil
        }
    }

#if os(macOS)
    public static func current() -> DeviceModel? {
        var size = Int.zero
        sysctlbyname("hw.model", nil, &size, nil, .zero)

        var machine = [CChar](repeating: .zero, count: size)
        sysctlbyname("hw.model", &machine, &size, nil, .zero)

        guard let code = String(cString: machine, encoding: .utf8) else {
            return nil
        }

        return if let value = _Macintosh(rawValue: code) {
            DeviceModel.Macintosh(value)
        } else {
            nil
        }
    }
#endif

#if os(iOS)
    public static func current() -> DeviceModel? {
        guard let code = currentModelCode() else {
            return nil
        }

        return if let value = _iPhone(rawValue: code) {
            DeviceModel.iPhone(value)
        } else if let value = _iPad(rawValue: code) {
            DeviceModel.iPad(value)
        } else {
            nil
        }
    }

    private static func currentModelCode() -> String? {
#if targetEnvironment(simulator)
        ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"]
#else
        var systemInfo = utsname()
        uname(&systemInfo)

        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let machine = machineMirror.children.compactMap { $0.value as? CChar }

        return String(cString: machine, encoding: .utf8)
#endif
    }
#endif
}
