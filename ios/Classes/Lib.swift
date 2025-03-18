import IOIOKSDK;
import Flutter

let SdkConfigInstance = IOIOKConfig.getInstance()!;
let SdkInstance = IOIOKSDK.getInstance();

func initSDK(view: UIViewController, args: Any!) async -> Bool {
  return await withCheckedContinuation { resole in
    let mArgs = args as! [String: Any];
    SdkConfigInstance.setAppKey(mArgs["appkey"] as? String);
    SdkConfigInstance.setAppSecret(mArgs["appSecret"] as? String);
    SdkConfigInstance.setAfDevKey(mArgs["afDevKey"] as? String);
    SdkConfigInstance.setUmkAppId(mArgs["umkAppid"] as? String);
    SdkConfigInstance.setIosAppId(mArgs["iosAppId"] as? String);
    SdkConfigInstance.setDebug(mArgs["debug"] as! Bool);
    SdkConfigInstance.setPrintLog(mArgs["log"] as! Bool);
    SdkConfigInstance.setStatUrl(mArgs["statUrl"] as? String);
    SdkConfigInstance.setServerUrl(mArgs["serverUrl"] as? String);
    SdkConfigInstance.setVideoUnitId(mArgs["videoUnitId"] as? String);
    SdkConfigInstance.setInsUnitId(mArgs["insUnitId"] as? String);
    SdkConfigInstance.setAdmobOpenUnitId(mArgs["openUnitId"] as? String);
    SdkConfigInstance.setNativeUnitId(mArgs["nativeUnitId"] as? String);
    SdkConfigInstance.setSmallNativeUnitId(mArgs["smallNativeUnitId"] as? String);
    SdkConfigInstance.setBannerUnitId(mArgs["bannerUnitId"] as? String)
    SdkConfigInstance.setBannerInlineUnitId(mArgs["bannerUnitId"] as? String)
    SdkConfigInstance.setBannerCollapsibleUnitId(mArgs["bannerUnitId"] as? String)
    SdkInstance.initWithCompletion({ isInit, userInfo in
      resole.resume(returning: isInit)
    }, andUIViewCtrl: view)
  }
  
}

func showOpenAd(channel: FlutterMethodChannel, args: Any!) {
  let mArgs = args as! [String: Any];
  SdkInstance.showOpenAd(
    withSceneId: SdkConfigInstance.admobOpenUnitId,
    didHide: {
      adUnitId in channel.invokeMethod("onCallback", arguments: ["id": mArgs["id"], "args": ["type": "close"] ])
    },
    didFail: {
      adUnitId in channel.invokeMethod("onCallback", arguments: ["id": mArgs["id"], "args": ["type": "fail"] ])
    }
  )
}

func showInsAd(channel: FlutterMethodChannel, args: Any!) {
  let mArgs = args as! [String: Any];
  SdkInstance.showInterstitial(
    withSceneId: SdkConfigInstance.insUnitId,
    didHide: {
      adUnitId in channel.invokeMethod("onCallback", arguments: ["id": mArgs["id"], "args": ["type": "close"] ])
    },
    didFail: {
      adUnitId in channel.invokeMethod("onCallback", arguments: ["id": mArgs["id"], "args": ["type": "fail"] ])
    }
  )
}

func showRewardVideo(channel: FlutterMethodChannel, args: Any!) {
  let mArgs = args as! [String: Any];
  SdkInstance.showRewardVideo(
    withSceneId: SdkConfigInstance.videoUnitId,
    didReward: {
      adUnitId in channel.invokeMethod("onCallback", arguments: ["id": mArgs["id"], "args": ["type": "close"] ])
    },
    didFail: {
      adUnitId in channel.invokeMethod("onCallback", arguments: ["id": mArgs["id"], "args": ["type": "fail"] ])
    }
  )
}

func logEvent(name: String, args: [String: String]) {
  SdkInstance.track(withEventName: name, dictMap: args)
}
