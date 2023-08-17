import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      
      let channel = FlutterMethodChannel(name: "jessica.com.br/native", binaryMessenger: controller.binaryMessenger)
      
      channel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          
          guard call.method == "calcSum" else {
              result(FlutterMethodNotImplemented)
              return
          }
          
          if let args = call.arguments as? [String: Any],
             let numberA = args["numberA"] as? Int,
             let numberB = args["numberB"] as? Int {
              result(numberA+numberB)
          } else{
              result(-1)
          }
      })
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
