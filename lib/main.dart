import 'package:flutter/material.dart';
import 'package:prototype_posyandu/screens/find_patients_screen.dart';
import 'package:prototype_posyandu/screens/form_screen.dart';
import 'package:prototype_posyandu/screens/home_screen.dart';
import 'package:prototype_posyandu/screens/splash_screens.dart';
import 'package:prototype_posyandu/screens/target_data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PosyanduKu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/form': (context) => const FormScreen(),
        '/find-patient': (context) => const FindPatientsScreen(),
        '/target-data': (context) => const TargetDataScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}