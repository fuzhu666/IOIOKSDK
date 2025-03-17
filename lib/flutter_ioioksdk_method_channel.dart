import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_ioioksdk_platform_interface.dart';

/// An implementation of [FlutterIoioksdkPlatform] that uses method channels.
class MethodChannelFlutterIoioksdk extends FlutterIoioksdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_ioioksdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
