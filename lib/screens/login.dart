import 'package:flutter/material.dart';
import 'package:login_register/screens/register.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final ValueNotifier<bool> _isObscured = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 60, 5, 5),
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  children: [
                    const Text(
                      "Hello Again!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Text("Welcome back you've been missed!"),
                    const SizedBox(height: 50.0),
                    TextFormField(
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
                    ValueListenableBuilder<bool>(
                      valueListenable: _isObscured,
                      builder: (context, isObscure, child) {
                        return TextFormField(
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.auto),
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
                          onPressed: () {},
                          child: const Text("Sign In")),
                    ),
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
                        const Text("Don't have an account? "),
                        InkWell(
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
