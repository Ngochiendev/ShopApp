import 'package:flutter/material.dart';

class SizedList extends StatefulWidget {
  const SizedList({super.key});

  @override
  State<SizedList> createState() => _SizedListState();
}

class _SizedListState extends State<SizedList> {
  final List<String> sizeList = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSelected = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: currentSelected == index
                    ? Colors.greenAccent
                    : Colors.white,
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 177, 174, 174),
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                sizeList[index],
                style: currentSelected == index
                    ? const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )
                    : const TextStyle(color: Colors.black),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: sizeList.length,
      ),
    );
  }
}
