import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 60, 5, 5),
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                children: [
                  const Text(
                    "Create Account",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Text("Let's Create Account Together"),
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
                  TextFormField(
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
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(20)),
                        labelText: "Password",
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        floatingLabelBehavior: FloatingLabelBehavior.auto),
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
                      const Text("Already have an account? "),
                      InkWell(
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
