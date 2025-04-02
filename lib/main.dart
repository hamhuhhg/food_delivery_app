import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/resourese/auth_methods.dart';
import 'package:food_delivery_app/screens/homepage.dart';
import 'package:food_delivery_app/screens/loginpages/login.dart';
import 'package:food_delivery_app/utils/universal_variables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with your project-specific configuration
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyACAAARBWh7brVEDDTOengs33nNVx0J17E",
      appId: "1:615310209885:android:c183274295aae7806beeb4",
      messagingSenderId: "615310209885",
      projectId: "cityjucies",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(
          UniversalVariables.orangeColor.value,
          <int, Color>{
            50: UniversalVariables.orangeColor,
            100: UniversalVariables.orangeColor,
            200: UniversalVariables.orangeColor,
            300: UniversalVariables.orangeColor,
            400: UniversalVariables.orangeColor,
            500: UniversalVariables.orangeColor,
            600: UniversalVariables.orangeColor,
            700: UniversalVariables.orangeColor,
            800: UniversalVariables.orangeColor,
            900: UniversalVariables.orangeColor,
          },
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder<User?>(
        stream: _authMethods.onAuthStateChanged,
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
