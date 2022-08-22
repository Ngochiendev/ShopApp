import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/ultils/theme.dart';
import 'auth/login_screen.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 6),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return const LoginScreen();
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Column(
              children: const [
                TextUltils(
                  text: 'Welcome',
                  color: mainColor,
                  fontsize: 40,
                  fontWeight: FontWeight.bold,
                  textOverflow: TextOverflow.ellipsis,
                ),
                TextUltils(
                  text: 'Stilven Shop',
                  color: mainColor,
                  fontsize: 40,
                  fontWeight: FontWeight.bold,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            child: Lottie.asset(
              './assets/image_json/flashscreen.json',
              fit: BoxFit.cover,
            ),
          ),
          // const SizedBox(height: 230),
          Container(
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
