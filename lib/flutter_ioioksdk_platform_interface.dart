import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_ioioksdk_method_channel.dart';

abstract class FlutterIoioksdkPlatform extends PlatformInterface {
  /// Constructs a FlutterIoioksdkPlatform.
  FlutterIoioksdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterIoioksdkPlatform _instance = MethodChannelFlutterIoioksdk();

  /// The default instance of [FlutterIoioksdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterIoioksdk].
  static FlutterIoioksdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterIoioksdkPlatform] when
  /// they register themselves.
  static set instance(FlutterIoioksdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
