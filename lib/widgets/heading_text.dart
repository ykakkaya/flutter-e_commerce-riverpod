// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ecommerce/constants/app_sizes.dart';

class HeadingText extends StatelessWidget {
  String text;
  Color color;
  TextOverflow? overflow;
  HeadingText({super.key, required this.text, required this.color, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: AppSizes.kHeadingSize, fontWeight: FontWeight.bold, color: color, overflow: overflow),
    );
  }
}
