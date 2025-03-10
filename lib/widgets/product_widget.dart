import 'package:flutter/material.dart';

import '../core/constants/app_styles.dart';
import '../data/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
     elevation: 0,
     shape: RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
         spacing: 2,
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
             height: 100,
             child: Center(
               child: Image.network(
                product.image,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Icon(Icons.image, size: 24));
                },
                         ),
             ),
            ),
            Text(product.title, style: AppStyles.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.price.toString()),
                Wrap(
              children: [
                Icon(Icons.favorite, color: Colors.amber, size: 12,),
                Text("4.2"),
              ],
            ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
