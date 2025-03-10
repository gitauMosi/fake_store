import 'package:flutter/material.dart';

import '../core/constants/app_strings.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.only(right: 3.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2)),
          child: Row(
            spacing: 5,
            children: [
              Icon(Icons.search),
              Text(AppStrings.searchPlaceholderStr),
            ],
          ),
        ),
        // Spacer(),
        Icon(Icons.photo_camera_outlined),
        Badge(
            label: Text("2"),
            child: Icon(Icons.shopping_cart_checkout_outlined))
      ],
    );
  }
}
