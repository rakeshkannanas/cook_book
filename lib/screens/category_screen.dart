import 'package:flutter/material.dart';
import '../dummy_food_list.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
        children: DUMMY_CATEGORIES.map((data) {
          return CategoryItem(data.title, data.color,data.id);
        }).toList(),
      );
  }
}
