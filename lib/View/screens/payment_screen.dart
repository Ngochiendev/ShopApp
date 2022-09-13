import 'package:flutter/material.dart';
import 'package:shopapp/View/widgets/payment/delivery_address_widget.dart';
import 'package:shopapp/View/widgets/payment/payment_method_widget.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 107, 220, 111),
        title: const Text('Payment'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUltils(
                text: 'Shipping to',
                fontsize: 25,
                fontWeight: FontWeight.w800,
              ),
              const SizedBox(height: 20),
              //deliveryContainerWidget
              const DeliveryAddressWidget(),
              const SizedBox(height: 20),
              const TextUltils(
                text: 'Payment Method',
                fontsize: 25,
                fontWeight: FontWeight.w800,
              ),
              const SizedBox(height: 20),
              //payment method
              const PaymentMethodWidget(),
              const SizedBox(height: 20),
              //Button
              Center(
                child: SizedBox(
                  height: 50,
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
