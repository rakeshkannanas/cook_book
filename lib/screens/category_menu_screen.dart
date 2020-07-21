import 'package:cook_book/models/menu.dart';
import 'package:cook_book/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import '../dummy_food_list.dart';

class CategoryMenuScreen extends StatefulWidget {
  static const routeName = 'category_menu_screen';
  final List<Menu> availableMenu;

  CategoryMenuScreen(this.availableMenu);

  @override
  _CategoryMenuScreenState createState() => _CategoryMenuScreenState();
}

class _CategoryMenuScreenState extends State<CategoryMenuScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments;
    final String title = args['title'];
    final String id = args['id'];
    final categoryMenu = widget.availableMenu.where((element) {
      return element.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        titleSpacing: 2.0,
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return MenuItem(
            id: categoryMenu[index].id,
            title: categoryMenu[index].title,
            duration: categoryMenu[index].duration,
            imgurl: categoryMenu[index].imageUrl,
            affordability: categoryMenu[index].affordability,
            complexity: categoryMenu[index].complexity,
          );
        },
        itemCount: categoryMenu.length,
      )),
    );
  }
}
