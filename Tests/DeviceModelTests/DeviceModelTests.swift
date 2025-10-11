import DeviceModel
import Testing

struct DeviceModelTests {
    @Test
    func check_current() {
        guard let modelName = DeviceModel.current()?.name else {
            return
        }
        print(modelName)
    }
}
