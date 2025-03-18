import Flutter
import Foundation
import GoogleMobileAds
import IOIOKSDK;

// 组件构造
class IOIOKConfigBannerView: NSObject, FlutterPlatformView {
  let frame: CGRect;
  let viewId: Int64;
  let params: NSDictionary?;
  var messenger: FlutterBinaryMessenger!
  
  init(_ frame: CGRect, viewID: Int64, args :Any?, binaryMessenger: FlutterBinaryMessenger) {
    self.frame = frame;
    self.viewId = viewID;
    self.messenger = binaryMessenger;
    self.params = args as? NSDictionary
  }  
  

  func view() -> UIView {
    let mHeight = params?.value(forKey: "height") as? Double
    let mWidth = params?.value(forKey: "width") as? Double
//    let mBannerType = params?.value(forKey: "type") as? String
    
    print(params?.value(forKey: "height") as? Double)
    print(params?.value(forKey: "width") as? Double)
    let mAdSize = GADAdSize()
    let mBannerView = GADBannerView(adSize: GADInlineAdaptiveBannerAdSizeWithWidthAndMaxHeight(mWidth!, mHeight!))
    mBannerView.adUnitID = IOIOKConfig.getInstance().bannerUnitId
    mBannerView.load(GADRequest())
    return mBannerView
  }
}

// 组件工厂
class IOIOKConfigBannerViewFactory : NSObject,FlutterPlatformViewFactory{
  var messenger: FlutterBinaryMessenger!
  
  func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
    return IOIOKConfigBannerView(frame,viewID : viewId , args : args,binaryMessenger:messenger);
  }
  
  func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol
  {
      return FlutterStandardMessageCodec.sharedInstance()
  }
  
  @objc public init(messenger: (NSObject & FlutterBinaryMessenger)?) {
    super.init()
    self.messenger = messenger
  }
}

// 注册组件
class IOIOKConfigBannerViewPlugin {
  static func registerWith(registry:FlutterPluginRegistry) {
    let pluginKey = "IOIOKConfig_Banner_View";
    if (registry.hasPlugin(pluginKey)) {return};
    let registrar = registry.registrar(forPlugin: pluginKey);
    let messenger = registrar!.messenger() as! (NSObject & FlutterBinaryMessenger)
    registrar!.register(IOIOKConfigBannerViewFactory(messenger: messenger),withId: "IOIOKConfigBannerView");
  }
  
  static func registerWithPlugin(registrar: FlutterPluginRegistrar) {
    let messenger = registrar.messenger() as! (NSObject & FlutterBinaryMessenger)
    registrar.register(IOIOKConfigBannerViewFactory(messenger: messenger),withId: "IOIOKConfigBannerView");
  }
}
