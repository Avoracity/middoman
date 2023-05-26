import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:middoman/screens/forgot_password.dart';
import 'package:middoman/widgets/customized_button.dart';
import 'package:middoman/widgets/customized_textfield.dart';

import '../get_started_container/get_started_page.dart';
import '../services/firebase_auth_service.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.deepPurple,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 40, 0, 40),
              child: Text(
                "Welcome Back!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            CustomizedTextfield(
              myController: _emailController,
              hintText: "Enter your email",
              isPassword: false,
            ),
            CustomizedTextfield(
              myController: _passwordController,
              hintText: "Enter your password",
              isPassword: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()));
                  },
                  child: const Text("Forgot Password?",
                      style: TextStyle(color: Color(0xff6A707C), fontSize: 15)),
                ),
              ),
            ),
            CustomizedButton(
              buttonText: "Login",
              buttonColor: Colors.deepPurple,
              textColor: Colors.white,
              onPressed: () async {
                try {
                  await FirebaseAuthService().login(
                      _emailController.text.trim(),
                      _passwordController.text.trim());
                  if (FirebaseAuth.instance.currentUser != null) {
                    if (!mounted) return;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const GetStartedPage()));
                  }
                } on FirebaseException catch (e) {
                  debugPrint("error is ${e.message}");

                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              title: const Text(
                                  "Invalid Username or Password. Please register again or make sure that username and password is correct."),
                              actions: [
                                ElevatedButton(
                                  child: const Text("OK"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ]));
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 25, 0, 25),
              child: Row(
                children: [
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.height * 0.16,
                    color: Colors.grey,
                  ),
                  const Text("      or login with      "),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.height * 0.15,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: OutlinedButton(
                        child: const Image(
                          image: AssetImage("assets/google_logo.png"),
                          height: 30,
                          width: 30,
                        ),
                        onPressed: () async {
                          await FirebaseAuthService().logininwithgoogle();

                          if (FirebaseAuth.instance.currentUser != null) {
                            if (!mounted) return;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GetStartedPage()));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                        title: const Text(
                                            "No user exist with these credentials. Please register first."),
                                        actions: [
                                          ElevatedButton(
                                            child: const Text("OK"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ]));
                          }
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 50, 0, 10.0),
              child: Row(
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignUpScreen()));
                    },
                    child: const Text("Register Now",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            )
          ]),
        ),
      )),
    );
  }
}
