import 'package:flutter_test/flutter_test.dart';
import 'package:ioioksdk/ioioksdk.dart';
import 'package:ioioksdk/ioioksdk_platform_interface.dart';
import 'package:ioioksdk/ioioksdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIoioksdkPlatform
    with MockPlatformInterfaceMixin
    implements IoioksdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final IoioksdkPlatform initialPlatform = IoioksdkPlatform.instance;

  test('$MethodChannelIoioksdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIoioksdk>());
  });

  test('getPlatformVersion', () async {
    Ioioksdk ioioksdkPlugin = Ioioksdk();
    MockIoioksdkPlatform fakePlatform = MockIoioksdkPlatform();
    IoioksdkPlatform.instance = fakePlatform;

    expect(await ioioksdkPlugin.getPlatformVersion(), '42');
  });
}
