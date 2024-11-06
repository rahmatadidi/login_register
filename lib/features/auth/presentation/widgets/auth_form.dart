import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:login_register/features/auth/viewmodels/auth_viewmodel.dart';
import 'package:login_register/screens/login.dart';
import 'package:login_register/utils/validator.dart';
import 'package:provider/provider.dart';

class AuthForm extends StatelessWidget {
  AuthForm({super.key});

  final ValueNotifier<bool> _isObscured = ValueNotifier<bool>(true);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 60, 5, 5),
            width: MediaQuery.of(context).size.width / 1.1,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(20)),
                        labelText: "Name",
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        floatingLabelBehavior: FloatingLabelBehavior.auto),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: emailController,
                    validator: (value) => Validator.validateEmail(value ?? ""),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(20)),
                        labelText: "Email Address",
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        floatingLabelBehavior: FloatingLabelBehavior.auto),
                  ),
                  const SizedBox(height: 30.0),
                  ValueListenableBuilder<bool>(
                    valueListenable: _isObscured,
                    builder: (context, isObscure, child) {
                      return TextFormField(
                        controller: passwordController,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  _isObscured.value = !isObscure;
                                }),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(),
                                borderRadius: BorderRadius.circular(20)),
                            labelText: "Password",
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            floatingLabelBehavior: FloatingLabelBehavior.auto),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white),
                        onPressed: authViewModel.isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  authViewModel.registerUser(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                        child: authViewModel.isLoading
                            ? const CircularProgressIndicator()
                            : const Text("Register"),
                      )),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black),
                      label: const Text("Sign In With Google"),
                      icon: Image.asset(
                        "assets/images/google_logo.png",
                        width: 25,
                        height: 25,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      InkWell(
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
