import 'dart:math';
import 'package:bottle/helper.dart';
import 'package:bottle/home/Bottles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation spinner;

  int index;
  double position;

  @override
  void initState() {
    super.initState();
    index = 0;
    position = 0;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    spinner = Tween(begin: 0.0, end: random()).animate(controller);
  }

  change(int x) {
    setState(() {
      index = x;
    });
  }

  spin() {
    controller.forward(from: 0.0);
    setState(() {
      spinner = Tween(begin: 0.0, end: random()).animate(controller);
    });
  }

  double random() {
    int rand = Random().nextInt(100);
    double rotation = rand / 100;
    return 3.0 + rotation;
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: blackBlue,
      body: Container(
        height: data.size.height,
        width: data.size.width,
        child: Center(
          child: Stack(
            children: <Widget>[
              Center(
                child: RotationTransition(
                  turns: spinner,
                  child: Container(
                    height: data.size.width * 0.5,
                    width: data.size.width * 0.5,
                    child: Center(
                      child: Image.asset(
                        'images/$index.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: data.size.width * 0.1,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: data.size.height * 0.09),
                child: Bottles(
                  active: index,
                  change: change,
                ),
              ),
              GestureDetector(
                onTap: spin,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: data.size.height * 0.05),
                  child: Image.asset(
                    'images/spin.png',
                    height: data.size.width * 0.2,
                    width: data.size.width * 0.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
