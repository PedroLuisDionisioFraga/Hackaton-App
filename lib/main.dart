import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/Pages/Authentication/sign_up.dart';
import 'Database/firebase_helper.dart';
import 'Presentation/Themes/dark_theme.dart';
import 'Presentation/Themes/light_theme.dart';

void main() async {
  await FirebaseHelper.firebaseConnection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hackathon",
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: ThemeMode.light,
      home: const SignUpPage(),
    );
  }
}
