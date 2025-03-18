import 'package:flutter/services.dart';
import 'package:flutter_ioioksdk/PageBannerAds.dart';

class FlutterIoioksdk {
  static final instance = FlutterIoioksdk();

  final platform = const MethodChannel('flutter_ioioksdk');
  /// 回调对象
  final Map<String, Function> _callbackGroup = {};

  FlutterIoioksdk() {
    platform.setMethodCallHandler((call) async {
      if (call.method == 'onCallback') {
        Function? mCallback = _callbackGroup[call.arguments['id']];
        if (mCallback != null) {
          mCallback(call.arguments['args']);
          // _callbackGroup.remove(call.arguments['id']);
        }
      }
    });
  }

  static const BannerAD = PagebannerAds;

  /// 初始化sdk
  static Future<bool> initSDK({
    required String appkey,
    required String appSecret,
    required String serverUrl,
    required String statUrl,
    bool debug = false,
    bool log = false,
    String? iosAppId,
    String? umkAppid,
    String? afDevKey,
    String? videoUnitId,
    String? insUnitId,
    String? openUnitId,
    String? bannerUnitId,
    String? nativeUnitId,
    String? smallNativeUnitId
  }) async {
    return await instance.platform.invokeMethod('initSDK', {
      'appkey': appkey,
      'appSecret': appSecret,
      'serverUrl': serverUrl,
      'statUrl': statUrl,
      'debug': debug,
      'log': log,
      'iosAppId': iosAppId,
      'umkAppid': umkAppid,
      'afDevKey': afDevKey,
      'videoUnitId': videoUnitId,
      'insUnitId': insUnitId,
      'openUnitId': openUnitId,
      'nativeUnitId': nativeUnitId,
      'smallNativeUnitId': smallNativeUnitId,
      'bannerUnitId': bannerUnitId
    });
  }

  /// 展示开屏广告
  static Future<void> showOpenAd(Function callback) async {
    await invokeMethodCallback("showOpenAd", {}, callback);
  }


  /// 展示插屏广告
  static Future<void> showInsAd(Function callback) async {
    await invokeMethodCallback("showInsAd", {}, callback);
  }

  /// 展示激励广告
  static Future<void> showRewardVideo(Function callback) async {
    await invokeMethodCallback("showRewardVideo", {}, callback);
  }

  /// 打点
  static Future<void> logEvent(String name, Map<String, String> args) async {
    await instance.platform.invokeMethod("logEvent", { "name": name, ...args });
  }

  // 可以回调的调用原生ios
  static Future<void> invokeMethodCallback(
    String name,
    Map<String, dynamic> args,
    Function callback
  ) async {
    String mId = 'callback${DateTime.timestamp().microsecondsSinceEpoch}';
    instance._callbackGroup[mId] = callback;
    await instance.platform.invokeMethod(name, {'id': mId, ...args});
  }
}
