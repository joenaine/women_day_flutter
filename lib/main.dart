import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:women_day/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDbVXkJz98v6_KY6low2IZE4C9NLR68XPs",
        authDomain: "forever-7-125.firebaseapp.com",
        projectId: "forever-7-125",
        storageBucket: "forever-7-125.appspot.com",
        messagingSenderId: "807716513648",
        appId: "1:807716513648:web:10f6edd95b3d96ed12d1b5"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '7-125',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Nunito',
      ),
      scrollBehavior: CustomScrollBehaviour(),
      home: const HomeScreen(),
    );
  }
}

class CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
