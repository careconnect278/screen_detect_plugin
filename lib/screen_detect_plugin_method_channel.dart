import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'screen_detect_plugin_platform_interface.dart';

/// An implementation of [ScreenDetectPluginPlatform] that uses method channels.
class EventChannelScreenDetectPlugin extends ScreenDetectPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final eventChannel =  const EventChannel('com.example.okk/screen');

  @override
  Future<String?> getPlatformVersion() async {
    
    return "Not Implemented";
  }
}
