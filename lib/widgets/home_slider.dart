import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_images.dart';
import 'package:ecommerce/constants/app_sizes.dart';
import 'package:ecommerce/constants/app_text.dart';
import 'package:ecommerce/widgets/heading_text.dart';
import 'package:ecommerce/widgets/sub_heading_text.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.kRadius),
        color: AppColors.kPrimaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //yazı Alanı
          Padding(
            padding: EdgeInsets.all(AppSizes.kSliderPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText(
                  text: AppText.sliderHeading,
                  color: AppColors.kWhiteColor,
                ),
                SubHeadingText(text: AppText.sliderSubHeading, color: AppColors.kWhiteColor),
                ElevatedButton(onPressed: () {}, child: Text(AppText.sliderButtonText))
              ],
            ),
          ),
          //Resim alanı
          Expanded(child: Image.asset(AppImages.landing)),
        ],
      ),
    );
  }
}
