import 'package:fake_store/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/cart_model.dart';
import '../providers/cart_provider.dart';

class CartCardWidget extends ConsumerWidget {
  CartModel cartmodel;
  CartCardWidget({super.key, required this.cartmodel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).cardColor,
                    image: DecorationImage(
                        image: NetworkImage(cartmodel.product.image),
                        fit: BoxFit.cover))),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Text(
                    cartmodel.product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.subTitleBold,
                  ),
                  Text(
                    "\$/intern",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${cartmodel.product.price}",
                        style: AppStyles.bodyLargeBold,
                      ),
                      Spacer(),
                      Wrap(
                        spacing: 7,
                        children: [
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .decrementQuantity(cartmodel);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Product Decrement"),
                              ));
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.5)),
                              child: Icon(
                                Icons.remove,
                                size: 14,
                              ),
                            ),
                          ),
                          Text(
                            cartmodel.quantity.toString(),
                            style: AppStyles.bodyMedium,
                          ),
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .incrementQuantity(cartmodel);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Product increment"),
                              ));
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.primary),
                              child: Icon(
                                Icons.add,
                                size: 14,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Icon(
              Icons.close,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
