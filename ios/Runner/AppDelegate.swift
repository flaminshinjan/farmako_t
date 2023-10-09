import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as!
      FlutterViewController
      
      let METHOD_CHANNEL_NAME = "samples.flutter.dev/battery"
      let batteryChannel = FlutterMethodChannel(
          name: METHOD_CHANNEL_NAME,
          binaryMessenger: controller.binaryMessenger)
      
      batteryChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          switch call.method {
          case "getBatteryLevel":
              guard let args = call.arguments as? [String: String] else {return}
              let name = args["name"]!
              result(self.recieveBatteryLevel())
          default:
              result(FlutterMethodNotImplemented)
          }
      })
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    private func recieveBatteryLevel() -> Int {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        
        if device.batteryState == UIDevice.BatteryState.unknown {
            return 100
        } else {
            return Int(device.batteryLevel * 100)
        }
    }

}

