import 'package:flutter/material.dart';
import 'package:umeng_kit/umeng_kit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Umeng.init(channelId: 'official');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Umeng Kit'),
        ),
      ),
    );
  }
}
