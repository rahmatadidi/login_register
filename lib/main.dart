import 'package:flutter/material.dart';
import 'package:login_register/features/auth/presentation/pages/register_page.dart';
import 'package:login_register/screens/home.dart';
import 'package:login_register/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: RegisterPage()),
    );
  }
}
