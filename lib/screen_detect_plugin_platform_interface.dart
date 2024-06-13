import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screen_detect_plugin_method_channel.dart';

abstract class ScreenDetectPluginPlatform extends PlatformInterface {
  /// Constructs a ScreenDetectPluginPlatform.
  ScreenDetectPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenDetectPluginPlatform _instance = EventChannelScreenDetectPlugin();

  /// The default instance of [ScreenDetectPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenDetectPlugin].
  static ScreenDetectPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenDetectPluginPlatform] when
  /// they register themselves.
  static set instance(ScreenDetectPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
