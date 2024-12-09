import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_sizes.dart';
import 'package:ecommerce/constants/app_text.dart';
import 'package:ecommerce/widgets/body_text.dart';
import 'package:ecommerce/widgets/chip_widget.dart';
import 'package:ecommerce/widgets/custom_appbar.dart';
import 'package:ecommerce/widgets/home_slider.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:ecommerce/widgets/sub_heading_text.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appText: AppText.homeAppbarText,
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.kPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              //Slider
              const HomeSlider(),
              //Categories
              SizedBox(
                height: 75,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    ChipWidget(
                      chipText: AppText.chipText1,
                    ),
                    ChipWidget(
                      chipText: AppText.chipText2,
                    ),
                    ChipWidget(
                      chipText: AppText.chipText3,
                    ),
                    ChipWidget(chipText: AppText.chipText4),
                    ChipWidget(chipText: AppText.chipText5),
                    ChipWidget(chipText: AppText.chipText6),
                  ],
                ),
              ),
              //HotSales Products
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubHeadingText(
                    text: AppText.hotSales,
                    color: AppColors.kBlackColor,
                  ),
                  BodyText(text: AppText.seeAll, color: AppColors.kPrimaryColor)
                ],
              ),
              //Products List
              SizedBox(
                width: double.infinity,
                height: 350,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        SizedBox(width: 250, height: 350, child: ProductCard()),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubHeadingText(
                    text: AppText.salesProducts,
                    color: AppColors.kBlackColor,
                  ),
                  BodyText(text: AppText.seeAll, color: AppColors.kPrimaryColor)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
