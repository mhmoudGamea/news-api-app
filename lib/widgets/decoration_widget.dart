import 'package:flutter/material.dart';
import '../constants.dart';

class DecorationWidget extends StatelessWidget {
  final double width;
  final double height;
  final double topLeft;
  final double bottomLeft;
  final double topRight;
  final double bottomRight;

  const DecorationWidget({
    Key? key,
    required this.width,
    required this.height,
    this.topLeft = 0,
    this.bottomLeft = 0,
    this.topRight = 0,
    this.bottomRight = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          bottomLeft: Radius.circular(bottomLeft),
          topRight: Radius.circular(topRight),
          bottomRight: Radius.circular(bottomRight)
        )
      ),
    );
  }
}
