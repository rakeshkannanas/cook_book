import 'package:cook_book/screens/category_screen.dart';
import 'package:cook_book/screens/filters_screen.dart';
import 'package:cook_book/screens/tab_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.center,
            child: Text(
              'Cooking Up !',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Icon(
                Icons.restaurant,
                size: 24,
              ),
              title: Text('Menu Category'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Divider(
                color: Colors.black,
              )),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 24,
            ),
            title: Text('Filters'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
