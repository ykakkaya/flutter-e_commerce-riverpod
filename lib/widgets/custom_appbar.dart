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
          style: TextStyle(color: AppColors.kWhiteColor, fontSize: AppSizes.kHeadingSize),
        ),
        centerTitle: true,
        backgroundColor: AppColors.kSecondaryColor,
        actions: [
          Stack(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined)),
            const Positioned(
                width: 20,
                height: 20,
                right: 25,
                top: 5,
                child: Badge(
                  backgroundColor: Colors.black,
                )),
            const Positioned(
                right: 30,
                top: 5,
                child: Text(
                  "0",
                  style: TextStyle(color: Colors.white),
                ))
          ])
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
