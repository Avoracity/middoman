import 'package:flutter/material.dart';
import 'package:middoman/screens/login_screen.dart';
import 'package:middoman/widgets/customized_button.dart';

import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.jpg"))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 250,
                  width: 350,
                  child: Image(
                    image: AssetImage("assets/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                CustomizedButton(
                  buttonText: "Login",
                  buttonColor: Colors.deepPurple,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()));
                  },
                ),
                CustomizedButton(
                  buttonText: "Register",
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SignUpScreen()));
                  },
                ),
                const SizedBox(height: 50)
              ],
            )));
  }
}
