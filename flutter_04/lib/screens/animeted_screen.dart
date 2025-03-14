import 'dart:math';

import 'package:flutter/material.dart';

class AimetedScreen extends StatefulWidget {
  const AimetedScreen({Key? key}) : super(key: key);

  @override
  State<AimetedScreen> createState() => _AimetedScreenState();
}

class _AimetedScreenState extends State<AimetedScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void chageShepe() {
    final random = Random();
    _width = random.nextInt(300).toDouble() + 70;
    _height = random.nextInt(300).toDouble() + 70;
    _color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 10);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animeted Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          width: _width,
          height: _height,
          //color: Colors.red,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          chageShepe();
        },
        child: const Icon(
          Icons.play_arrow_outlined,
          size: 40,
        ),
      ),
    );
  }
}
