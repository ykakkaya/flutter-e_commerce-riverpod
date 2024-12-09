// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ecommerce/constants/app_sizes.dart';

class BodyText extends StatelessWidget {
  String text;
  Color color;
  TextOverflow? overflow;
  BodyText({
    super.key,
    required this.text,
    required this.color,
    this.overflow ,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: AppSizes.kBodySize,
          fontWeight: FontWeight.normal,
          color: color,
          overflow: overflow),
    );
  }
}
