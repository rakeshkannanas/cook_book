import 'package:cook_book/models/menu.dart';
import 'package:cook_book/screens/category_screen.dart';
import 'package:cook_book/screens/fav_screen.dart';
import 'package:cook_book/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  final List<Menu> favMenu;
  TabScreen(this.favMenu);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedIndex = 0;
   List<Map<String, Object>> pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages =  [
      {'page': CategoryScreen(), 'title': 'Cook Book'},
      {'page': FavScreen(widget.favMenu), 'title': 'Favorites'}
    ];
  }

  void tabClick(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[selectedIndex]['title'],),
        titleSpacing: 2,
        elevation: 6,
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: tabClick,
        currentIndex: selectedIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favorites')),
        ],
      ),
    );
  }
}
