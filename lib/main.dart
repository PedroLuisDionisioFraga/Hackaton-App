import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/Pages/Authentication/log_in.dart';
import 'package:flutter_application_1/Presentation/Pages/Authentication/sign_up.dart';
import 'package:flutter_application_1/Presentation/Pages/main_screen.dart';
import 'Database/firebase_helper.dart';
import 'Presentation/Pages/complete_list.dart';
import 'Presentation/Pages/monitoring_page.dart';
import 'Presentation/Pages/pie_chart.dart';
import 'Presentation/Pages/Home/Sessions/our_products_session.dart';
import 'Presentation/Pages/speedometer.dart';
import 'Presentation/Themes/dark_theme.dart';
import 'Presentation/Themes/light_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'Presentation/Pages/Home/homepage.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'Shared/Widgets/a_aleatorio_apps.dart';

void main() async {
  await FirebaseHelper.firebaseConnection();
  // Definindo o local pra poder fazer a conversão de moeda
  initializeDateFormatting("pt_Br");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hackathon",
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: ThemeMode.light,
      routes: {
        '/homepage': (context) => const HomePage(),
        '/SignUpPage': (context) => const SignUpPage(),
        '/LoginPage': (context) => const LoginPage(),
        '/mainPage': (context) => const MainMenu(),
        '/monitoringPage': (context) => const MonitoringPage(index: 0),
        '/CompleteList': (context) => const ContainerList(),
        '/ChartPie': (context) => const ChartPie(),
        '/OurProductsSession': (context) => const OurProductsSession(),
        '/speedometer': (context) => const SpeedometerUpload(),
        '/ContainerApps': (context) => const ContainerApps(),
        '/Connections': (context) => const ConnectionsContainer(),
      },
      home: const InitialScreen(),
    );
  }
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 6)).then((_) {
      Navigator.pushReplacementNamed(context, '/homepage');
    });
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.secondaryContainer,
            ],
          ),
        ),
        child: Image.asset('Assets/Images/icon.png')
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(delay: 1000.ms, duration: 1800.ms) // shimmer +
            .shake(hz: 4, curve: Curves.easeInOutCubic) // shake +
            .scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1), duration: 600.ms) // scale up
            .then(delay: 600.ms) // then wait and
            .scale(
              begin: const Offset(1.1, 1.1),
              end: const Offset(1.0, 1.0),
            )
            .custom(
              builder: (context, value, child) => Container(
                padding: const EdgeInsets.all(200),
                child: child, // child is the Text widget being animated
              ),
            ),
      ),
    );
  }
}
