// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shopapp/View/widgets/auth/auth_text_form_field.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';

import 'component/social_login.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController username_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: size.height * 0.32,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Image.asset(
                    './assets/images/Secure login-bro.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  // color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: const [
                              TextUltils(
                                text: 'Welcome!',
                                fontsize: 35,
                                fontWeight: FontWeight.w700,
                              ),
                              TextUltils(
                                text: 'Signin to continue',
                                fontsize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 109, 180, 238),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              //email
                              AuthTextFormField(
                                controller: widget.username_controller,
                                validator: () {},
                                prefixIcon:
                                    Image.asset('./assets/images/user.png'),
                                hintText: 'Username',
                                labelText: 'Username',
                              ),
                              const SizedBox(height: 25),
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
                              const SizedBox(height: 5),

                              //Button forget
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      print('forget password');
                                    },
                                    child: const TextUltils(
                                      text: 'Forget Password?',
                                      color: Colors.black54,
                                      fontsize: 15,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                              const SizedBox(height: 5),
                              //Button login
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color.fromARGB(
                                        255, 107, 220, 111),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const TextUltils(
                                    text: 'Login',
                                    fontsize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 25),
                                child: Row(
                                  children: const [
                                    Flexible(
                                      child: Divider(
                                        height: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
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
                                    icon: './assets/icons/facebook-2.svg',
                                    onpress: () {
                                      print('facebook');
                                    },
                                  ),
                                  SocialCard(
                                    icon: './assets/icons/google-icon.svg',
                                    onpress: () {
                                      print('google');
                                    },
                                  ),
                                ],
                              ),
                            ],
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                    color: Color.fromARGB(255, 107, 220, 111),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextUltils(
                        text: 'Don\'t have an Account?',
                        color: Colors.white,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              print('SignUp');
                            },
                            child: const TextUltils(
                              text: 'Sign Up',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            )),
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
