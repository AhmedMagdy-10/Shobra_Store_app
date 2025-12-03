import 'package:flutter/material.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_buttom.dart';

Widget buildCategories() {
  final List<String> categories = [
    'الكترونيات',
    'اكسسوارات',
    'ملابس حريمي',
    'ملابس رجالي',
    'كل المنتجات',
  ];

  return Container(
    height: 50, // Fixed height prevents layout issues
    margin: EdgeInsets.symmetric(vertical: 10), // Add vertical spacing
    child: ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,

      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 10), // Space between buttons
          child: CustomButtonModifyed(text: categories[index]),
        );
      },
    ),
  );
}
