import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app_admin/views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyAoHxr6RW7WiBipapQjMW_m5xMBY7CfrKk", appId:"1:607158225107:android:1b98898b71df6c8421ac26" , messagingSenderId:"607158225107" , projectId: "grocery-app-e512b",
    storageBucket: "grocery-app-e512b.appspot.com",
    )
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
      home: AnimatedSplashScreen(),

    );
  }
}

