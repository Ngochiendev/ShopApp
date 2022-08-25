import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/screens/auth/component/auth_button.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/ultils/ultilService.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import 'component/check_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController username_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final TextEditingController email_controller = TextEditingController();
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
                    Get.toNamed('/signin_signupScreen');
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //imgae

                  Container(
                    height: size.height * 0.30,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(top: 30),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SvgPicture.asset(
                        './assets/icons/signup.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //text
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Form(
                        key: formKey,
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
                            const SizedBox(height: 15),

                            //username
                            AuthTextFormField(
                              controller: username_controller,
                              validator: (valueUsername) {
                                if (valueUsername.toString().length <= 2 ||
                                    !RegExp(validationName)
                                        .hasMatch(valueUsername)) {
                                  return "Enter valid name";
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon:
                                  Image.asset('./assets/images/user.png'),
                              hintText: 'Username',
                              labelText: 'Username',
                            ),
                            const SizedBox(height: 15),
                            //Email
                            AuthTextFormField(
                              controller: email_controller,
                              validator: (email) {
                                if (!RegExp(validationEmail).hasMatch(email)) {
                                  return "Valid email";
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon:
                                  Image.asset('./assets/images/email.png'),
                              hintText: 'Email',
                              labelText: 'Email',
                            ),
                            const SizedBox(height: 15),
                            //pasword
                            GetBuilder<Authcontroller>(
                              builder: (_) {
                                return AuthTextFormField(
                                  controller: password_controller,
                                  obscureText:
                                      controller.isVisibilty ? false : true,
                                  validator: (password) {
                                    if (password == null || password.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    if (password.length < 7) {
                                      return 'password isn\'t 7 characters';
                                    }
                                    return null;
                                  },
                                  prefixIcon:
                                      Image.asset('./assets/images/lock.png'),
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

                            //Text Term & Coditions
                            check_widget(),
                            //Button sign up
                            GetBuilder<Authcontroller>(
                              builder: (_) {
                                return AuthButton(
                                  text: 'SIGN UP',
                                  onpress: () {
                                    if (controller.isCheckbox == false) {
                                      Get.snackbar(
                                        'Check Box',
                                        'Please, Accept term & conditions and Privacy Policy',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                    } else if (formKey.currentState!
                                        .validate()) {
                                      String name =
                                          username_controller.text.trim();
                                      String email =
                                          email_controller.text.trim();
                                      String password =
                                          password_controller.text;
                                      controller.signUpUsingFirebase(
                                        name: name,
                                        email: email,
                                        password: password,
                                      );
                                      controller.isCheckbox = true;
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Bottom
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUltils(
                      text: 'Already have an Account?',
                      fontsize: 15,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                      ),
                      onPressed: () {
                        Get.offNamed("/loginScreen");
                        print('Loginpage');
                      },
                      child: const TextUltils(
                        text: 'Login',
                        fontsize: 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
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
