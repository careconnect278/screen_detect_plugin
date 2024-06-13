import 'package:flutter/material.dart';
import 'package:screen_detect_plugin/screen_service.dart';
import 'package:screen_detect_plugin_example/background_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final Screen _screen = Screen();
  String _screenLockTimes = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Lock/Unlock Times'),
      ),
      body: Center(
        child: Text(_screenLockTimes),
      ),
    );
  }
}
