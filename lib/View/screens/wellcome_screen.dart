import 'package:flutter/material.dart';

class WellComeScreen extends StatefulWidget {
  const WellComeScreen({Key? key}) : super(key: key);

  @override
  State<WellComeScreen> createState() => _WellComeScreenState();
}

class _WellComeScreenState extends State<WellComeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('data')),
    );
  }
}
