import 'package:bottle/helper.dart';
import 'package:flutter/material.dart';

class Bottles extends StatelessWidget {
  final int active;
  final Function change;

  Bottles({
    this.active,
    this.change,
  });

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(numberOfBottles, (index) {
        String image = 'images/$index';
        if (index == active) {
          image += 'a';
        }
        image += '.png';
        return GestureDetector(
          onTap: () {
            change(index);
          },
          child: Container(
            width: data.size.width * 0.3,
            margin: EdgeInsets.symmetric(
              horizontal: data.size.width * 0.04,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                data.size.width * 0.025,
              ),
              color: index == active ? cyan : purple,
            ),
            child: RotatedBox(
              quarterTurns: 5,
              child: Image.asset(
                image,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        );
      }),
    );
  }
}
