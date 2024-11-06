import 'package:flutter/material.dart';
import 'package:login_register/features/auth/presentation/pages/register_page.dart';
import 'package:login_register/features/auth/viewmodels/auth_viewmodel.dart';
import 'package:login_register/screens/home.dart';
import 'package:login_register/screens/login.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(
    MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyApp(),
        '/login': (context) => Login(),
        '/home': (context) => const Home(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const RegisterPage(),
    );
  }
}
