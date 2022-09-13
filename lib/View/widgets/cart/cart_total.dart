import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/cart_controller.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextUltils(
                  text: 'Total',
                  fontsize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 128, 125, 125),
                ),
                SizedBox(
                  width: 100,
                  child: TextUltils(
                    text: '\$ ${controller.total}',
                    fontsize: 20,
                    fontWeight: FontWeight.w600,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 107, 220, 111),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed('paymentScreen');
                      print('check out');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('CHECK OUT', style: TextStyle(fontSize: 20)),
                        SizedBox(width: 15),
                        Icon(Icons.shopping_cart),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
