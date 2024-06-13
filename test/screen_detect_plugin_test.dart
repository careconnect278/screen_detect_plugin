import 'package:flutter_test/flutter_test.dart';
import 'package:screen_detect_plugin/screen_detect_plugin.dart';
import 'package:screen_detect_plugin/screen_detect_plugin_platform_interface.dart';
import 'package:screen_detect_plugin/screen_detect_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScreenDetectPluginPlatform
    with MockPlatformInterfaceMixin
    implements ScreenDetectPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ScreenDetectPluginPlatform initialPlatform = ScreenDetectPluginPlatform.instance;

  test('$EventChannelScreenDetectPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<EventChannelScreenDetectPlugin>());
  });

  test('getPlatformVersion', () async {
    ScreenDetectPlugin screenDetectPlugin = ScreenDetectPlugin();
    MockScreenDetectPluginPlatform fakePlatform = MockScreenDetectPluginPlatform();
    ScreenDetectPluginPlatform.instance = fakePlatform;

    expect(await screenDetectPlugin.getPlatformVersion(), '42');
  });
}
