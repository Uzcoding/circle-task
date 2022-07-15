import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pixelRatio = window.devicePixelRatio;

    var logicalScreenSize = window.physicalSize / pixelRatio;
    var logicalWidth = logicalScreenSize.width;
    var logicalHeight = logicalScreenSize.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StackTut(
        screenX: logicalWidth,
        screenY: logicalHeight,
      ),
    );
  }
}

class StackTut extends StatefulWidget {
  final double screenX;
  final double screenY;
  const StackTut({
    Key? key,
    required this.screenX,
    required this.screenY,
  }) : super(key: key);

  @override
  State<StackTut> createState() => _StackTutState();
}

class _StackTutState extends State<StackTut> {
  Color circleColor = Colors.red;
  double cirlePosX = 100;
  double circlePosY = 100;
  double circleSize = 300;

  @override
  void initState() {
    super.initState();
    cirlePosX = (widget.screenX - circleSize) / 2;
    circlePosY = (widget.screenY - circleSize) / 2;
  }

  void onTap(double x, double y) {
    moveCirlcToRandomPos(x, y);
    circleColor = generateRandomColor();

    setState(() {});
  }

  void moveCirlcToRandomPos(double x, double y) {
    final maxHorizontal = (widget.screenX - circleSize).toInt();
    final maxVertical = (widget.screenY - circleSize).toInt();
    final newValueX = Random().nextInt(maxHorizontal).toDouble();
    final newValueY = Random().nextInt(maxVertical).toDouble();

    cirlePosX = newValueX;
    circlePosY = newValueY;
  }

  Color generateRandomColor() =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: cirlePosX,
            top: circlePosY,
            child: GestureDetector(
              onTap: () => onTap(size.width, size.height),
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
