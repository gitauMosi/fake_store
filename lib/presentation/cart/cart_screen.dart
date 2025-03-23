import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_styles.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/cart_card_widget.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifierAsyncValue = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: AppStyles.titleSmall,
        ),
        centerTitle: true,
        actions: [Icon(Icons.shopping_bag_rounded)],
      ),
      body: cartNotifierAsyncValue.isEmpty
          ? Center(child: Text("Empty Cart"))
          : ListView.builder(
              itemCount: cartNotifierAsyncValue.length,
              itemBuilder: (context, index) {
                return CartCardWidget(cartmodel: cartNotifierAsyncValue[index]);
              }),
      bottomSheet: SizedBox(
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total price (4):",
                    style: AppStyles.subTitleMediumBold,
                  ),
                  Text(
                    "\$${ref.read(cartNotifierProvider.notifier).getTotal()}",
                    style: AppStyles.bodyLargeBold,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.50,
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.primary),
                    child: Center(
                        child: Text(
                      "Checkout",
                      style: AppStyles.titleSmall.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
