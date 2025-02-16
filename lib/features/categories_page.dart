import 'package:fake_store/providers/product_repo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryAsyncValue = ref.watch(categoriesProductProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: categoryAsyncValue.when(
          data: (categories) {
            return ListView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          itemBuilder: (context, index){
            return Text(categories[index]);
          });
          },
         error: (error, stack){
           return Text("An error occurred: ${error.toString()}\nStack trace: $stack");
         },
          loading: ()=> Center(child: CircularProgressIndicator(),))
      ),
    );
  }
}