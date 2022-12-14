import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/auth/auth_text_form_field.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/ultils/ultilService.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<Authcontroller>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
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
                      Get.back();
                      print("back forgot");
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 420,
                        width: size.width,
                        child: SvgPicture.asset(
                          './assets/icons/forgetpassword.svg',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const TextUltils(
                            text: 'Forgot',
                            fontsize: 37,
                            fontWeight: FontWeight.w600,
                          ),
                          const TextUltils(
                            text: 'Password?',
                            fontsize: 37,
                            fontWeight: FontWeight.w600,
                          ),
                          const TextUltils(
                            text:
                                'Don\'t worry! It happens. Please enter the address associated with your account.',
                            fontsize: 14.3,
                            color: Color.fromARGB(255, 117, 119, 117),
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 40),
                          //Email
                          AuthTextFormField(
                            controller: emailcontroller,
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
                          const SizedBox(height: 40),
                          GetBuilder<Authcontroller>(
                            builder: (_) {
                              return SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color.fromARGB(
                                        255, 107, 220, 111),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {
                                    
                                    if (formKey.currentState!.validate()) {
                                      String email =
                                          emailcontroller.text.trim();
                                      controller.resetPassword(email);
                                    }
                                  },
                                  child: const TextUltils(
                                    text: 'Submit',
                                    fontsize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
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
    );
  }
}
