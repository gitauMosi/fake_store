import 'package:fake_store/core/constants/app_styles.dart';
import 'package:fake_store/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductViewScreen extends StatelessWidget {
  Product product;
  ProductViewScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.favorite),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.share),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_bag_rounded),
          )
        ],
      ),
      body: _buildBody(context, size),
      bottomSheet: _customRow(context),
    );
  }

  SizedBox _customRow(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Price",
                  style: AppStyles.subTitleBold,
                ),
                Text(
                  "\$${product.price}",
                  style: AppStyles.bodyLargeBold,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 8,
                      children: [
                        Icon(
                          Icons.shopping_bag_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                        Text(
                          "1",
                          style: AppStyles.bodyMediumBold.copyWith(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface),
                  child: Center(
                      child: Text(
                    "Buy now",
                    style: AppStyles.bodyLargeBold
                        .copyWith(color: Theme.of(context).colorScheme.surface),
                  )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, Size size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.40,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: Center(
              child: Image.network(
                product.image,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Icon(Icons.image, size: 24));
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          productInfoSection(),
          SizedBox(
            height: 15,
          ),
          FooterSection(
            product: product,
          ),
        ],
      ),
    );
  }

  Widget productInfoSection() {
    return Column(
      children: [
        Text(
          product.title,
          style: AppStyles.subTitleBold,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.amber,
                ),
                Text("4.9 Ratings"),
              ],
            ),
            SizedBox(
              width: 5,
            ),
            customRow("2.5k+ Reviews"),
            SizedBox(
              width: 5,
            ),
            customRow("2.9k + Sold")
          ],
        )
      ],
    );
  }

  Row customRow(String name) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 3,
        ),
        Text(name),
      ],
    );
  }
}

class FooterSection extends StatefulWidget {
  Product product;
  FooterSection({super.key, required this.product});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  final List<String> tabsItems = ["About Product", "Reviews"];
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  tabsItems.map((item) => _customTabbarItem(item)).toList(),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              child: [
                _aboutProductSection(),
                _reviewsProductSection()
              ][selectedTabIndex],
            )
          ],
        ),
      ),
    );
  }

  Column _aboutProductSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Product",
          style: AppStyles.bodyLargeBold,
        ),
        Text(widget.product.description),
      ],
    );
  }

  Column _reviewsProductSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: AppStyles.bodyLargeBold,
        ),
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel est ac nulla consectetur vulputate. Sed vel est ac nulla consectetur vulputate. Sed vel est ac nulla consectetur vulputate."),
        SizedBox(height: 10.0),
        Text(
          "Write a Review",
          style: AppStyles.bodyMediumBold,
        ),
        SizedBox(height: 10.0),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _customTabbarItem(String item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = tabsItems.indexOf(item);
        });
      },
      child: Container(
        padding: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          border: selectedTabIndex == tabsItems.indexOf(item)
              ? Border(
                  bottom:
                      BorderSide(color: Theme.of(context).colorScheme.primary))
              : null,
        ),
        child: Text(item),
      ),
    );
  }
}
