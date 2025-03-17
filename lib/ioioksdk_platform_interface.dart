import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ioioksdk_method_channel.dart';

abstract class IoioksdkPlatform extends PlatformInterface {
  /// Constructs a IoioksdkPlatform.
  IoioksdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static IoioksdkPlatform _instance = MethodChannelIoioksdk();

  /// The default instance of [IoioksdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelIoioksdk].
  static IoioksdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IoioksdkPlatform] when
  /// they register themselves.
  static set instance(IoioksdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
