import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            storageBucket: 'instagram-clone-aea69.appspot.com',
            apiKey: 'AIzaSyCQ6U9t0muVRXbi9RaSaa-jx8vu4wYh9fA',
            appId: '1:873543773730:web:4a7ae8333f5e1b2a24647b',
            messagingSenderId: '873543773730',
            projectId: 'instagram-clone-aea69'));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        home:
            const SignupScreen() /*const ResponsiveLayout(
            webSreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout())*/
        );
  }
}
