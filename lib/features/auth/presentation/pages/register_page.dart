import 'package:flutter/material.dart';
import 'package:login_register/features/auth/presentation/widgets/auth_form.dart';
import 'package:login_register/features/auth/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Consumer<AuthViewModel>(builder: (
          context,
          authViewModel,
          child,
        ) {
          return authViewModel.isLoading
              ? const CircularProgressIndicator()
              : AuthForm();
        }),
      ),
    );
  }
}
