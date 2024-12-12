// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/constants/app_sizes.dart';
import 'package:ecommerce/controller/cart_list_controller.dart';
import 'package:ecommerce/screens/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppbar extends ConsumerWidget implements PreferredSizeWidget {
  String appText;
  CustomAppbar({
    super.key,
    required this.appText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItem = ref.watch(cartProductNotifier).length;
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
          Stack(children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartView()));
                },
                icon: const Icon(Icons.shopping_bag_outlined)),
            const Positioned(
                width: 20,
                height: 20,
                right: 25,
                top: 5,
                child: Badge(
                  backgroundColor: Colors.red,
                )),
            Positioned(
                right: 29,
                top: 5,
                child: Text(
                  cartItem.toString(),
                  style: const TextStyle(color: Colors.white),
                ))
          ])
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
