// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/constants/app_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  String appText;
  CustomAppbar({
    super.key,
    required this.appText,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Drawer simgesi dahil tüm ikonları beyaz yapar
        ),
        title: Text(
          appText,
          style: TextStyle(
              color: AppColors.kWhiteColor, fontSize: AppSizes.kHeadingSize),
        ),
        centerTitle: true,
        backgroundColor: AppColors.kSecondaryColor,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined))
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
