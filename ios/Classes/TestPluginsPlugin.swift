import Flutter
import UIKit
import IOIOKSDK

public class TestPluginsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    
    let channel = FlutterMethodChannel(name: "IOIOKSDK", binaryMessenger: registrar.messenger())
    let instance = TestPluginsPlugin()
    registrar.addMethodCallDelegate(instance,  channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
