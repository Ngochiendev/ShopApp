import 'package:flutter/material.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({super.key});

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPaymentIndex = 1;
  bool changColor = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildPaymentMethod(
          name: 'Paypal',
          image: './assets/images/paypal.png',
          value: 1,
          onChange: (int? value) {
            setState(() {
              radioPaymentIndex = value!;
            });
          },
          scale: 0.7,
        ),
        buildPaymentMethod(
          name: 'Google Pay',
          image: './assets/images/google.png',
          value: 2,
          onChange: (int? value) {
            setState(() {
              radioPaymentIndex = value!;
            });
          },
          scale: 0.7,
        ),
        buildPaymentMethod(
          name: 'CreditCard',
          image: './assets/images/visa.png',
          value: 3,
          onChange: (int? value) {
            setState(() {
              radioPaymentIndex = value!;
            });
          },
          scale: 0.7,
        ),
        const SizedBox(height: 20),
        const TextUltils(
          text: 'Total: 200 \$',
          fontsize: 20,
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }

  Widget buildPaymentMethod({
    required String name,
    required String image,
    required int value,
    required Function onChange,
    required double scale,
  }) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3.0,
          blurRadius: 5,
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    image,
                    scale: scale,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 10),
                TextUltils(text: name),
              ],
            ),
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            fillColor: MaterialStateColor.resolveWith(
              (states) => Colors.greenAccent,
            ),
            onChanged: (int? value) {
              onChange(value);
            },
          ),
        ],
      ),
    );
  }
}
