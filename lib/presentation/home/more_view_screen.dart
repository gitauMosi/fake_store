import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_strings.dart';
import '../../data/models/product_model.dart';
import '../../providers/product_repo_provider.dart';
import '../../widgets/product_widget.dart';

class MoreViewScreen extends ConsumerWidget {
  const MoreViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsyncValue = ref.watch(allProductProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.popularStr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: productAsyncValue.when(
            data: (products) {
              return _buildBody(products);
            },
            error: (error, stack) => Center(
                  child: Text(AppStrings.errorMessage),
                ),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }

  Widget _buildBody(List<Product> products) {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0.9,
          crossAxisSpacing: 0.9,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return ProductWidget(product: product);
        });
  }
}
