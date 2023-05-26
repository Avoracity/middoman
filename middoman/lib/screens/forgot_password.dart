import 'package:flutter/material.dart';
import 'package:middoman/widgets/customized_button.dart';

import '../widgets/customized_textfield.dart';
import 'login_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                padding: EdgeInsets.fromLTRB(10.0, 40, 0, 10),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 40),
                child: Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: TextStyle(
                    color: Color(0xff8391A1),
                    fontSize: 20,
                  ),
                ),
              ),
              CustomizedTextfield(
                myController: _emailController,
                hintText: "Enter your email",
                isPassword: false,
              ),
              CustomizedButton(
                buttonText: "Reset Password",
                buttonColor: Colors.deepPurple,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(108, 270, 108, 10.0),
                child: Row(
                  children: [
                    const Text(
                      "Remember Password? ",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()));
                      },
                      child: const Text("Login",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
