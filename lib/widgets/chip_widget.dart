import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  ChipWidget({
    super.key,
    required this.chipText,
  });
  String chipText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.kRadius),
        ),
        label: Text(
          chipText,
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
        backgroundColor: AppColors.kChipBackground,
      ),
    );
  }
}
