import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/ultils/theme.dart';
import 'package:get/get.dart';

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
        Get.offAllNamed("/signin_signupScreen");
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
                  fontsize: 50,
                  fontWeight: FontWeight.bold,
                  textOverflow: TextOverflow.ellipsis,
                ),
                TextUltils(
                  text: 'Stilven Shop',
                  color: mainColor,
                  fontsize: 50,
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
