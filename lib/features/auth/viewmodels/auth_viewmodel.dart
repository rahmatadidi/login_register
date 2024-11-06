import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:login_register/main.dart';

class AuthViewModel with ChangeNotifier {
  final Logger _logger = Logger();
  bool isLoading = false;

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      // Simulasi proses registrasi
      await Future.delayed(const Duration(seconds: 2));

      isLoading = false;
      notifyListeners();

      // Tampilkan SnackBar
      scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text("User Registered Successfully!"),
          backgroundColor: Colors.blue,
        ),
      );

      // Penundaan sebelum navigasi
      await Future.delayed(const Duration(seconds: 1));

      // Navigasi ke layar login menggunakan route
      Navigator.of(scaffoldMessengerKey.currentContext!)
          .pushReplacementNamed('/login');
    } catch (e) {
      isLoading = false;
      notifyListeners();

      // Tampilkan SnackBar untuk error
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
