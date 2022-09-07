import 'package:flutter/material.dart';
import 'package:shopapp/View/widgets/category/category_widget.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: TextUltils(
                text: 'Category',
                fontsize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
