import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ReusableCard({super.key, required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget? cardChild;
  final GestureTapCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: cardChild,
      ),
    );
  }
}
