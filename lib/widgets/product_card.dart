import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_sizes.dart';
import 'package:ecommerce/widgets/body_text.dart';
import 'package:ecommerce/widgets/heading_text.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            SizedBox(
                width: 250,
                height: 200,
                child: Image.asset('assets/products/macbook.jpg')),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText(
                  text: 'Macbook Pro',
                  color: AppColors.kBlackColor,
                ),
                BodyText(
                  text: 'Ürünlere ait açıklama buraya gelecek',
                  color: AppColors.kBlackColor,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BodyText(
                      text: '\$1000',
                      color: AppColors.kBlackColor,
                    ),
                    IconButton(
                        onPressed: () {}, icon:  Icon(Icons.add_circle,size: AppSizes.kIconSize,))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
