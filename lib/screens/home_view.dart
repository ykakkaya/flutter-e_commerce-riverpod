import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_sizes.dart';
import 'package:ecommerce/constants/app_text.dart';
import 'package:ecommerce/controller/product_list_controller.dart';
import 'package:ecommerce/widgets/body_text.dart';
import 'package:ecommerce/widgets/chip_widget.dart';
import 'package:ecommerce/widgets/custom_appbar.dart';
import 'package:ecommerce/widgets/home_slider.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:ecommerce/widgets/sub_heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNotifier = ref.watch(productNotifierProvider);
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
                  itemCount: productNotifier.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 250,
                        height: 350,
                        child: ProductCard(
                          index: index,
                        )),
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
              MasonryGridView.builder(
                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        height: 350,
                        child: ProductCard(
                          index: index,
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
