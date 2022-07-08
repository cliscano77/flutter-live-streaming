import 'package:flutter/material.dart';
import 'package:video_stream/camera.dart';

import 'screen/dashboard_page.dart';

List<CameraDescription> cameras = [];

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    debugPrint(e.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Stream',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'GoogleSans',
      ),
      home: const DashboardPage(),
    );
  }
}
