import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/ultils/ultilService.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import 'component/check_widget.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController username_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final TextEditingController email_controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<Authcontroller>();

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
              Positioned(
                top: 40,
                left: 20,
                height: 30,
                width: 30,
                child: GestureDetector(
                  onTap: () {
                    Get.offNamed("/loginScreen");
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Form(
                        key: widget.formKey,
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

                            //username
                            AuthTextFormField(
                              controller: widget.username_controller,
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
                            const SizedBox(height: 20),
                            //Email
                            AuthTextFormField(
                              controller: widget.email_controller,
                              validator: (email) {
                                // if (!RegExp(validationEmail).hasMatch(email)) {
                                //   return "Valid email";
                                // } else {
                                //   return null;
                                // }
                                if (email == null || email.isEmtry) {
                                  return "Enter your email";
                                }
                                if (!email.isEmail) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                              prefixIcon:
                                  Image.asset('./assets/images/email.png'),
                              hintText: 'Email',
                              labelText: 'Email',
                            ),
                            const SizedBox(height: 20),
                            //pasword
                            GetBuilder<Authcontroller>(
                              builder: (_) {
                                return AuthTextFormField(
                                  controller: widget.password_controller,
                                  obscureText: widget.controller.isVisibilty
                                      ? false
                                      : true,
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
                                      widget.controller.Visibilty();
                                      print('show');
                                    },
                                    child: widget.controller.isVisibilty
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                  ),
                                );
                              },
                            ),

                            //Text Term & Coditions
                            check_widget(),
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
                  //Bottom
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
                            text: 'Already have an Account?',
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
                            },
                            child: const TextUltils(
                              text: 'Login',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
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
