import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:middoman/services/firebase_auth_service.dart';
import '../get_started_container/get_started_page.dart';
import '../widgets/customized_button.dart';
import '../widgets/customized_textfield.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
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
              padding: EdgeInsets.fromLTRB(10.0, 25, 0, 10),
              child: Text(
                "Let's get started",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            CustomizedTextfield(
              myController: _usernameController,
              hintText: "Username",
              isPassword: false,
            ),
            CustomizedTextfield(
              myController: _emailController,
              hintText: "Email",
              isPassword: false,
            ),
            CustomizedTextfield(
              myController: _passwordController,
              hintText: "Password",
              isPassword: true,
            ),
            CustomizedTextfield(
              myController: _confirmPasswordController,
              hintText: "Confirm password",
              isPassword: true,
            ),
            CustomizedButton(
              buttonText: "Register",
              buttonColor: Colors.deepPurple,
              textColor: Colors.white,
              onPressed: () async {
                try {
                  await FirebaseAuthService().signup(
                      _emailController.text.trim(),
                      _passwordController.text.trim());
                  // Save the user in the database
                  var client = http.Client();
                  var uri = Uri.parse(
                      'https://my-first-app-249520.uk.r.appspot.com/users');
                  var res = await client.post(uri, body: {
                    'user_name': _usernameController.text.trim(),
                    'user_email': _emailController.text.trim(),
                    'user_password': _passwordController.text.trim()
                  });

                  if (!mounted) return;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                } on FirebaseException catch (e) {
                  debugPrint("error is ${e.message}");

                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              title: const Text(
                                  "Error occured. Please try again."),
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
              padding: const EdgeInsets.fromLTRB(13, 5, 0, 5),
              child: Row(
                children: [
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.height * 0.15,
                    color: Colors.grey,
                  ),
                  const Flexible(
                    child: Text(
                      " or register with ",
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                                              })
                                        ]));
                          }
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 20, 0, 0.0),
              child: Row(
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()));
                    },
                    child: const Text("Login Now",
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
