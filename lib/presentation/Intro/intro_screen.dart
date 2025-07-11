import 'package:flutter/material.dart';

import 'package:social_media/core/bacground.dart';
import 'package:social_media/core/size.dart';
import 'package:social_media/presentation/Authentication/login/login_screen.dart';
import 'package:social_media/presentation/Authentication/signup/signup_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? "assets/images/introImagedark.png"
                      : "assets/images/introImagelight.png",
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  LoginScreen(),
                      ),
                    );
                  },
                  child: const Text("登陆"),
                ),
                constHeight20,
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  SignupScreen(),
                      ),
                    );
                  },
                  child: const Text("注册"),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
