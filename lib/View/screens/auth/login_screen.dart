import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          SizedBox(
            height: 350,
            child: Lottie.asset(
              './assets/image_json/login.json',
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
