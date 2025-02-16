import 'package:fake_store/data/models/product_model.dart';
import 'package:fake_store/providers/product_repo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsyncValue = ref.watch(allProductProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Fake Store"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: productAsyncValue.when(
                data: (products) {
                  return ListView.builder(
                      itemCount: products.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Product product = products[index];
                        return ListTile(
                          leading: Image.network(
                            product.image,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.image,
                                  size:
                                      24);
                            },
                          ),
                          title: Text(product.title),
                          onTap: () {
                            // Handle product click here
                          },
                        );
                      });
                },
                error: (error, stack) => Center(
                      child: Text(error.toString()),
                    ),
                loading: () => Center(
                      child: CircularProgressIndicator(),
                    ))));
  }
}
