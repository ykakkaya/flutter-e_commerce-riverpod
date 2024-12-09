// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ecommerce/constants/app_sizes.dart';

class SubHeadingText extends StatelessWidget {
  String text;
  Color color;
  SubHeadingText({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: AppSizes.kSubHeadingSize,
          fontWeight: FontWeight.normal,
          color: color),
    );
  }
}
