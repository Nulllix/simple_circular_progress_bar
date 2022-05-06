import Flutter
import UIKit

public class SwiftSimpleCircularProgressBarPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "simple_circular_progress_bar", binaryMessenger: registrar.messenger())
    let instance = SwiftSimpleCircularProgressBarPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
