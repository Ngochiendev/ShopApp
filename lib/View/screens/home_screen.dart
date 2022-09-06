import 'package:flutter/material.dart';
import 'package:shopapp/View/widgets/home/search_text_form.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';

import '../widgets/home/card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 107, 220, 111),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextUltils(
                    text: 'Find Your',
                    color: Colors.white,
                    fontsize: 25,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.8,
                  ),
                  const TextUltils(
                    text: 'INSPIRATION',
                    color: Colors.white,
                    fontsize: 28,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                  const SizedBox(height: 10),
                  SearchFormText(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextUltils(
              text: 'Category',
              fontsize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 30),
          CardItems(),
        ],
      ),
    );
  }
}
