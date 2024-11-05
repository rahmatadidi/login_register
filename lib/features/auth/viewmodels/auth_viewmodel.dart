// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:login_register/features/auth/data/auth_service.dart';

class AuthViewmodel with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> registerUser(
    BuildContext context, {
    required String name,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    String message; // Menyimpan pesan di sini
    try {
      message = await _authService.registerUser(
        name: name,
        email: email,
        password: password,
      );
    } catch (error) {
      message = 'Error: $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }

    // Pastikan Snackbar ditampilkan setelah selesai
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
        backgroundColor: message.startsWith('Error') ? Colors.red : Colors.blue,
      ));
    }
  }
}
