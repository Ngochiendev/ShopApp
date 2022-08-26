import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';

class Signin_SignupScreen extends StatelessWidget {
  const Signin_SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              //imgae
              Container(
                height: size.height * 0.45,
                margin: const EdgeInsets.only(top: 15),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SvgPicture.asset('./assets/icons/Shopping.svg',
                      fit: BoxFit.cover),
                ),
              ),
              //Slogan
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const TextUltils(
                  text: " HELLO! ",
                  fontsize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const TextUltils(
                  text:
                      " If you can’t be better than your competition, just dress better ",
                  fontsize: 16.5,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 162, 160, 160),
                  textAlign: TextAlign.center,
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 230,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 107, 220, 111),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            print('login screen');

                            Get.toNamed('/loginScreen');
                          },
                          child: const TextUltils(
                            text: 'LOGIN',
                            fontsize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: 230,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                    width: 2, color: Colors.green)),
                          ),
                          onPressed: () {
                            print('signup screen');

                            Get.toNamed('/signupScreen');
                          },
                          child: const TextUltils(
                            text: 'SIGN UP',
                            fontsize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
