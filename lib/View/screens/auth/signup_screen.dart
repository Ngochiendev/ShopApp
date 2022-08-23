import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/auth/auth_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController username_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final TextEditingController email_controller = TextEditingController();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                height: 30,
                width: 30,
                child: GestureDetector(
                  onTap: () {
                    Get.offNamed("/loginScreen");
                    print('loginScreen');
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //imgae
                  Container(
                    height: size.height * 0.34,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    margin: const EdgeInsets.only(top: 15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SvgPicture.asset('./assets/icons/signup.svg',
                          fit: BoxFit.cover),
                    ),
                  ),
                  //text
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const TextUltils(
                              text: 'Hi!',
                              fontsize: 40,
                              fontWeight: FontWeight.w700,
                            ),
                            const TextUltils(
                              text: 'Create a new account',
                              fontsize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 109, 180, 238),
                            ),
                            const SizedBox(height: 20),

                            //email
                            AuthTextFormField(
                              controller: widget.username_controller,
                              validator: () {},
                              prefixIcon:
                                  Image.asset('./assets/images/user.png'),
                              hintText: 'Username',
                              labelText: 'Username',
                            ),
                            const SizedBox(height: 20),
                            //Email
                            AuthTextFormField(
                              controller: widget.email_controller,
                              validator: () {},
                              prefixIcon:
                                  Image.asset('./assets/images/email.png'),
                              hintText: 'Email',
                              labelText: 'Email',
                            ),
                            const SizedBox(height: 20),
                            //pasword
                            AuthTextFormField(
                              controller: widget.password_controller,
                              obscureText: true,
                              validator: () {},
                              prefixIcon:
                                  Image.asset('./assets/images/lock.png'),
                              hintText: 'Password',
                              labelText: 'Password',
                              suffixIcon: const Icon(Icons.visibility),
                            ),

                            //Text Term & Coditions
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text:
                                          "By signing up, you're agree to our and ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Term & Coditions',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          String url =
                                              "http://bit.ly/kilimo-term-condition";
                                          if (await canLaunch(url)) {
                                            await launch(url,
                                                forceSafariVC: true);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: " and ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          String url =
                                              "http://bit.ly/kilimo-private-policy";
                                          if (await canLaunch(url)) {
                                            await launch(url,
                                                forceSafariVC: true);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            //Button sign up
                            SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color.fromARGB(
                                        255, 107, 220, 111),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                onPressed: () {},
                                child: const TextUltils(
                                  text: 'SIGN UP',
                                  fontsize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 30),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                        color: Color.fromARGB(255, 107, 220, 111),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextUltils(
                            text: 'joined us before?',
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                              ),
                              onPressed: () {},
                              child: const TextUltils(
                                text: 'Login',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
