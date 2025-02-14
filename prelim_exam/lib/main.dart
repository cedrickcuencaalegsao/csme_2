import 'package:flutter/material.dart';
// pages.
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/list_view.dart';
import 'pages/card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/list': (context) => const ListViewPage(),
        '/card': (context) => const CardView(),
      },
    );
  }
}
