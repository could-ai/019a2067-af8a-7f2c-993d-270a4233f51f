import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:couldai_user_app/camera_screen.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: ${e.code}\nError Message: ${e.description}');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hand Drawing Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: cameras.isEmpty
          ? const Scaffold(
              body: Center(
                child: Text('No camera found'),
              ),
            )
          : const CameraScreen(),
    );
  }
}
