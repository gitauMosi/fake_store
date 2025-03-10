import 'package:flutter/material.dart';

import '../core/constants/app_resources.dart';
import '../core/constants/app_strings.dart';
import '../core/constants/app_styles.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2.0,
            blurRadius: 4.0,
            offset: Offset(0, 1.0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  Icon(
                    Icons.badge_outlined,
                    size: 14,
                  ),
                  Text(
                    AppStrings.bestSellerStr,
                  ),
                ],
              ),
              Text(
                AppStrings.descStr,
                style: AppStyles.headLineStyle,
              ),
              SizedBox(
                height: 4,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(AppStrings.shoNow))
            ],
          ),
          Image.asset(
            AppResources.promoPngImage,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
