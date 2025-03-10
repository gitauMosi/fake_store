import 'package:flutter/material.dart';


class CustomCategoryChip extends StatelessWidget {
  final String category;
  const CustomCategoryChip({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // TODO: Handle category selection
      },
      child: Padding(
        padding: const EdgeInsets.only(
          right: 8.0
        ),
        child: Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.grey[300]!, width: 1.0),
          ),
          label: Text(category)),
      ),
    );
  }
}