import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:screen_detect_plugin/screen_service.dart';

// Entry point for the background service
@pragma('vm-entry-point')
Future onStart(ServiceInstance service) async {
  // Ensure that Dart plugin is initialized
  // DartPluginRegistrant.ensureInitialized();

  // If the service is an instance of AndroidServiceInstance
  if (service is AndroidServiceInstance) {
    // Listen for events to set the service as foreground or background
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });
    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  // Listen for event to stop the service
  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // If the service is an instance of AndroidServiceInstance
  if (service is AndroidServiceInstance) {
    // Check if the service is running in foreground
    if (await service.isForegroundService()) {
      final Screen screen = Screen();
      // Initialize Firebase and GetStorage
      print("object");
      screen.screenStateStream!.listen(
        (event) {
          print(event);
        },
      );
      // Start listening for screen events in the background
      debugPrint('Background service started');
    } else {
      debugPrint('Background service not in foreground');
    }
  }
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStartOnBoot: true,
      isForegroundMode: true,
      autoStart: true,
    ),
    iosConfiguration: IosConfiguration(
      onForeground: onStart,
      autoStart: true,
    ),
  );

  await service.startService();
}
