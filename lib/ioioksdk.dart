
import 'ioioksdk_platform_interface.dart';

class Ioioksdk {
  Future<String?> getPlatformVersion() {
    return IoioksdkPlatform.instance.getPlatformVersion();
  }
}
