import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/welcome_screen.dart';
import '../utils/flutter_flow_theme.dart';
import '../utils/flutter_flow_widgets.dart';
import '../profile_creation/create_profile.dart';

class StartedButton extends StatelessWidget {
  const StartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 55),
            child: FFButtonWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateProfile()),
                );
              },
              text: 'Add Myself',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: const Color.fromARGB(255, 151, 110, 86),
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // if (!mounted) return;
              // ignore: use_build_context_synchronously
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const WelcomeScreen();
              }));
            },
            child: const Text("Sign Out")),
      ],
    );
  }
}
