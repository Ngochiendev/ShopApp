import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/logic/controller/payment_controller.dart';

class DeliveryAddressWidget extends StatefulWidget {
  const DeliveryAddressWidget({super.key});

  @override
  State<DeliveryAddressWidget> createState() => _DeliveryAddressWidgetState();
}

class _DeliveryAddressWidgetState extends State<DeliveryAddressWidget> {
  final TextEditingController phoneEdit = TextEditingController();
  final controller = Get.find<PaymentController>();
  final authController = Get.find<Authcontroller>();
  int radioContainerIndex = 1;
  bool changColor = false;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          buildRadioContainer(
            address: "Mỹ thạnh đông 1",
            title: "Stilven Shop",
            name: "Võ Ngọc Hiện",
            phone: controller.phoneNumber.value,
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: "Enter your Phone Number",
                  titleStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textCancel: " Cancel ",
                  cancelTextColor: Colors.black,
                  textConfirm: " Save ",
                  confirmTextColor: Colors.white,
                  onCancel: () {
                    Get.toNamed('paymentScreen');
                  },
                  onConfirm: () {
                    controller.phoneNumber.value = phoneEdit.text;
                    Get.back();
                  },
                  content: TextField(
                    controller: phoneEdit,
                    maxLength: 11,
                    onSubmitted: (value) {
                      phoneEdit.text = value;
                    },
                    cursorColor: Colors.black54,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          phoneEdit.clear();
                          print("clear phone");
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(
                            color: Colors.blue), //lick vao co vien mau xanh
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Enter Your Phone Number',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                      isDense: true,
                      fillColor: Colors.greenAccent.withOpacity(0.2),
                      filled: true,
                    ),
                  ),
                );
              },
              child: const Icon(Icons.contact_phone),
            ),
            value: 1,
            onChange: (int? value) {
              setState(
                () {
                  radioContainerIndex = value!;
                  changColor = !changColor;
                },
              );
              controller.updatePositon();
            },
            color: changColor ? Colors.white : Colors.grey.shade400,
          ),
          const SizedBox(height: 10),
          buildRadioContainer(
            address: controller.address.value,
            title: "Stilven Shop",
            name: authController.displayUserName.value,
            phone: controller.phoneNumber.value,
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: "Enter your Phone Number",
                  titleStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textCancel: " Cancel ",
                  cancelTextColor: Colors.black,
                  textConfirm: " Save ",
                  confirmTextColor: Colors.white,
                  onCancel: () {
                    Get.toNamed('paymentScreen');
                  },
                  onConfirm: () {
                    controller.phoneNumber.value = phoneEdit.text;
                    Get.back();
                  },
                  content: TextField(
                    controller: phoneEdit,
                    maxLength: 11,
                    onSubmitted: (value) {
                      phoneEdit.text = value;
                    },
                    cursorColor: Colors.black54,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          phoneEdit.clear();
                          print("clear phone");
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(
                            color: Colors.blue), //lick vao co vien mau xanh
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Enter Your Phone Number',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                      isDense: true,
                      fillColor: Colors.greenAccent.withOpacity(0.2),
                      filled: true,
                    ),
                  ),
                );
              },
              child: const Icon(Icons.contact_phone),
            ),
            value: 2,
            onChange: (int? value) {
              setState(
                () {
                  radioContainerIndex = value!;
                  changColor = !changColor;
                },
              );
              controller.updatePositon();
            },
            color: changColor ? Colors.grey.shade400 : Colors.white,
          ),
        ],
      );
    });
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChange,
    required String name,
    required String phone,
    required String title,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            fillColor: MaterialStateColor.resolveWith(
              (states) => Colors.greenAccent,
            ),
            onChanged: (int? value) {
              onChange(value);
            },
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text(
                    '🇻🇳+84 ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    phone,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 80),
                  SizedBox(
                    child: icon,
                  )
                ],
              ),
              const SizedBox(height: 5),
              Text(
                address,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
