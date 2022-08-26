// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/auth/auth_text_form_field.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/ultils/ultilService.dart';

import 'component/auth_button.dart';
import 'component/social_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<Authcontroller>();
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
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 40,
                left: 20,
                height: 30,
                width: 30,
                child: GestureDetector(
                  onTap: () {
                    print('back signin & signup screen');

                    Get.toNamed("/signin_signupScreen");
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: size.height * 0.32,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(top: 30),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: SvgPicture.asset(
                        './assets/icons/login.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const TextUltils(
                            text: 'Welcome!',
                            fontsize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                          const TextUltils(
                            text: 'Signin to continue',
                            fontsize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 109, 180, 238),
                          ),
                          Form(
                            key: formKey,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  //Email
                                  AuthTextFormField(
                                    controller: email_controller,
                                    obscureText: false,
                                    validator: (valueEmail) {
                                      if (!RegExp(validationEmail)
                                          .hasMatch(valueEmail)) {
                                        return "Enter valid mail";
                                      } else {
                                        return null;
                                      }
                                    },
                                    prefixIcon: Image.asset(
                                        './assets/images/email.png'),
                                    hintText: 'Email',
                                    labelText: 'Email',
                                  ),
                                  const SizedBox(height: 15),
                                  //pasword
                                  GetBuilder<Authcontroller>(
                                    builder: (_) {
                                      return AuthTextFormField(
                                        controller: password_controller,
                                        obscureText: controller.isVisibilty
                                            ? false
                                            : true,
                                        validator: (password) {
                                          if (password == null ||
                                              password.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          if (password.length < 7) {
                                            return 'password isn\'t 7 characters';
                                          }
                                          return null;
                                        },
                                        prefixIcon: Image.asset(
                                            './assets/images/lock.png'),
                                        hintText: 'Password',
                                        labelText: 'Password',
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            controller.Visibilty();
                                            print('show');
                                          },
                                          child: controller.isVisibilty
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 5),

                                  //Button forget
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        onPressed: () {
                                          Get.toNamed("forgotScreen");
                                          print('forgot password');
                                        },
                                        child: const TextUltils(
                                          text: 'Forgot Password?',
                                          color: Colors.black54,
                                          fontsize: 15,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                  const SizedBox(height: 5),
                                  //Button login
                                  GetBuilder<Authcontroller>(
                                    builder: (_) {
                                      return AuthButton(
                                        text: 'LOGIN',
                                        onpress: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            String email =
                                                email_controller.text.trim();
                                            String password =
                                                password_controller.text;
                                            controller.logInUsingFirebase(
                                                email: email,
                                                password: password);
                                          }
                                        },
                                      );
                                    },
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Row(
                                      children: const [
                                        Flexible(
                                          child: Divider(
                                            height: 1,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            'Or Sign In with',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                        Flexible(
                                          child: Divider(
                                            height: 1,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SocialCard(
                                        icon:
                                            './assets/icons/facebook_icon.svg',
                                        onpress: () {
                                          print('facebook');
                                        },
                                      ),
                                      SocialCard(
                                        icon: './assets/icons/google_icon.svg',
                                        onpress: () {
                                          print('google');
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUltils(
                      text: 'Don\'t have an Account?',
                      fontsize: 15,
                      color: Colors.black,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed("/signupScreen");
                        print('SignUp');
                      },
                      child: const TextUltils(
                        text: 'Sign Up',
                        fontsize: 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
