import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ioioksdk/flutter_ioioksdk.dart';
import 'package:flutter_ioioksdk/flutter_ioioksdk_platform_interface.dart';
import 'package:flutter_ioioksdk/flutter_ioioksdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterIoioksdkPlatform
    with MockPlatformInterfaceMixin
    implements FlutterIoioksdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterIoioksdkPlatform initialPlatform = FlutterIoioksdkPlatform.instance;

  test('$MethodChannelFlutterIoioksdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterIoioksdk>());
  });

  test('getPlatformVersion', () async {
    FlutterIoioksdk flutterIoioksdkPlugin = FlutterIoioksdk();
    MockFlutterIoioksdkPlatform fakePlatform = MockFlutterIoioksdkPlatform();
    FlutterIoioksdkPlatform.instance = fakePlatform;

    expect(await flutterIoioksdkPlugin.getPlatformVersion(), '42');
  });
}
