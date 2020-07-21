import 'package:flutter/material.dart';
import '../screens/category_menu_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;
  const CategoryItem(@required this.title,@required this.color,@required this.id);

  void _categoryClick(BuildContext context)
  {
    Navigator.of(context).pushNamed(CategoryMenuScreen.routeName,arguments: {
      'id':id,
      'title':title,
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){_categoryClick(context);},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.6),color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title,
        style: Theme.of(context).textTheme.headline5,),

      ),
    );
  }
}
