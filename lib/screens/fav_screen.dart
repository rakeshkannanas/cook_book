import 'package:cook_book/models/menu.dart';
import 'package:cook_book/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatelessWidget {
  final List<Menu> favList;
  FavScreen(this.favList);
  @override
  Widget build(BuildContext context) {
    if (favList.isEmpty) {
      return Center(child: Text('No Favorites added yet'),);
    }
    else {
      return Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return MenuItem(
                id: favList[index].id,
                title: favList[index].title,
                duration: favList[index].duration,
                imgurl: favList[index].imageUrl,
                affordability: favList[index].affordability,
                complexity: favList[index].complexity,
              );
            },
            itemCount: favList.length,
          ));
    }
  }
}
