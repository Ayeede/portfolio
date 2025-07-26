import 'package:flutter/material.dart';

import 'components.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.onTap, required this.string});

  final GestureTapCallback onTap;
  final String string;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomBarColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(child: Text(string, style: kLargeButtonTextStyle)),
      ),
    );
  }
}
