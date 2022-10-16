// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:motor_flutter/motor_flutter.dart';
import 'package:motor_flutter_starter/models/sonr_data.dart' as sonrData;
import 'package:motor_flutter_starter/pages/start_page.dart';

sonrData.sonrClass patient = sonrData.sonrClass();

Future<void> main() async {
  await MotorFlutter.init();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEMPNAME',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash2 extends StatelessWidget {
  const Splash2({super.key});
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      navigateAfterSeconds: const SecondScreen(),
      title: const Text(
        'TEMPNAME',
        textScaleFactor: 2,
      ),
      // image: Image.network(
      //     'https://example.com/pic.png'),
      loadingText: const Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const StartPage();
  }
}
