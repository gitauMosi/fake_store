import 'package:fake_store/core/constants/app_strings.dart';
import 'package:fake_store/core/constants/app_styles.dart';
import 'package:fake_store/data/models/product_model.dart';
import 'package:fake_store/presentation/home/more_view_screen.dart';
import 'package:fake_store/providers/product_repo_provider.dart';
import 'package:fake_store/widgets/custom_category_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/product_widget.dart';
import '../../widgets/promo_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsyncValue = ref.watch(allProductProvider);
    final categoryAsyncValue = ref.watch(categoriesProductProvider);

    return Scaffold(
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                //top: MediaQuery.of(context).padding.top,
                left: 8,
                right: 8,
              ),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  children: [
                    //App Bar
                    CustomAppBar(),
                    //promo card
                    PromoCard(),
                    //categories
                    _categorysection(categoryAsyncValue),
          
                    _customRow(context),
          
                    productAsyncValue.when(
                        data: (products) {
                          return _buildBody(products);
                        },
                        error: (error, stack) => Center(
                              child: Text(AppStrings.errorMessage),
                            ),
                        loading: () => Center(
                              child: CircularProgressIndicator(),
                            )),
                  ],
                ),
              )),
        ));
  }

  Padding _customRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.recommendedStr,
            style: AppStyles.subTitleBold,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MoreViewScreen()));
            },
            child: Text(
              AppStrings.seeMoreStr,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _categorysection(AsyncValue<List<String>> categoryAsyncValue) {
    return SizedBox(
      height: 60,
      child: categoryAsyncValue.when(
          data: (categories) {
            return ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomCategoryChip(
                    category: categories[index],
                  );
                });
          },
          error: (error, stack) {
            return Text(AppStrings.noDataStr);
          },
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }

  Widget _buildBody(List<Product> products) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0.9,
        crossAxisSpacing: 0.9,
        ),
        itemCount: products.length,
       itemBuilder: (context, index){
         Product product = products[index];
         return ProductWidget(product: product);
       });
  }
}


