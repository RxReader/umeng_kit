import 'package:flutter/material.dart';
import 'package:umeng_kit/umeng_kit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Umeng.init(
    appKey: '604ebf966ee47d382b802b67',
    channelId: 'official',
    logEnabled: true,
  );
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
        body: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('getTestDeviceInfo'),
              onTap: () async {
                print('Test Device Info: ${await Umeng.getTestDeviceInfo()}');
              },
            ),
            ListTile(
              title: const Text('startPageTracking'),
              onTap: () {
                print('startPageTracking: 测试');
                Umeng.startPageTracking(pageName: '测试');
              },
            ),
            ListTile(
              title: const Text('stopPageTracking'),
              onTap: () {
                print('stopPageTracking: 测试');
                Umeng.stopPageTracking(pageName: '测试');
              },
            ),
            ListTile(
              title: const Text('trackEvent'),
              onTap: () {
                print('trackEvent: fuck you!');
                Umeng.trackEvent(eventId: 'fuck you!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
