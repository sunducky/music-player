import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player/screens/screen_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'ROOAH Test',
      theme: ThemeData.light(),
      themeMode: ThemeMode.system,
      home: const PlayerScreen(),
    );
  }
}
