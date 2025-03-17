
import 'flutter_ioioksdk_platform_interface.dart';

class FlutterIoioksdk {
  Future<String?> getPlatformVersion() {
    return FlutterIoioksdkPlatform.instance.getPlatformVersion();
  }
}
