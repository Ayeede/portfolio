import 'package:ayden_davis_portfolio_website/projects/bmi_calculator/components.dart';
import 'package:flutter/material.dart';

class IconSelector extends StatelessWidget {
  const IconSelector({super.key, required this.icon, required this.gender});

  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Icon(icon, size: 80, color: kLabelColor),
        Text(gender, style: kLabelTextStyle),
      ],
    );
  }
}
