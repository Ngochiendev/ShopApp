import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class check_widget extends StatelessWidget {
  check_widget({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<Authcontroller>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Authcontroller>(builder: (_) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                print('check');
                controller.Checkbox();
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckbox
                    ? Image.asset('./assets/images/check.png')
                    : null,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "I accept ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text: 'Term & Coditions',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          String url = "http://bit.ly/kilimo-term-condition";
                          if (await canLaunch(url)) {
                            await launch(url, forceSafariVC: true);
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
                          String url = "http://bit.ly/kilimo-private-policy";
                          if (await canLaunch(url)) {
                            await launch(url, forceSafariVC: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      style: const TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
