package com.example.screen_detect_plugin

import android.content.Context

import android.content.Intent
import android.content.IntentFilter
import android.os.Bundle
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.FlutterJNI


class ScreenDetectPlugin : FlutterPlugin, EventChannel.StreamHandler {
    private lateinit var screenBroadcastReceiver: ScreenBroadcastReceiver
    private lateinit var context: Context
   // private FlutterJNI flutterJNI = new FlutterJNI();


    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        val eventChannel = EventChannel(binding.binaryMessenger, "com.example.screen_detect_plugin/screen")
        eventChannel.setStreamHandler(this)
       // flutterJNI.attachToNative();
    }

   override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        // Clean up any resources
        println("Plugin detached from Flutter engine.")
    }


    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        screenBroadcastReceiver = ScreenBroadcastReceiver().apply {
            this.events = events
        }
        val filter = IntentFilter().apply {
            addAction(Intent.ACTION_SCREEN_OFF)
            addAction(Intent.ACTION_SCREEN_ON)
            addAction(Intent.ACTION_USER_PRESENT)
        }
        context.registerReceiver(screenBroadcastReceiver, filter)
    }

    override fun onCancel(arguments: Any?) {
        context.unregisterReceiver(screenBroadcastReceiver)
        screenBroadcastReceiver.events = null
    }
}
