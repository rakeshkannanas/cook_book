import 'package:cook_book/dummy_food_list.dart';
import 'package:cook_book/models/filter_model.dart';
import 'package:cook_book/models/menu.dart';
import 'package:cook_book/screens/fav_screen.dart';
import 'package:cook_book/screens/filters_screen.dart';
import 'package:cook_book/screens/menu_detail_screen.dart';
import 'package:cook_book/screens/tab_screen.dart';
import 'package:flutter/material.dart';

import 'screens/category_menu_screen.dart';
import 'screens/category_screen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FilterModel filters = FilterModel(isGluttenFree: false,isLactoseFree: false,vegan: false,vegetarian: false);
  List<Menu> availableMenu = DUMMY_MEALS;
  List<Menu> favMenu = [];
  void _setFilter(FilterModel filtersReceived)
  {
    setState(() {
      filters = filtersReceived;

      availableMenu = DUMMY_MEALS.where((element){
        if(filters.isGluttenFree && element.isGlutenFree)
        {
          return true;
        }
        if(filters.isLactoseFree && element.isLactoseFree)
        {
          return true;
        }
        if(filters.vegan && element.isVegan)
        {
          return true;
        }
        if(filters.vegetarian && element.isVegetarian)
        {
          return true;
        }
        return false;
      }).toList();
    });
  }
  void setFav(String id)
  {
      var index = favMenu.indexWhere((element) {
       return element.id == id;
      });
      if(index>=0)
        {
          setState(() {
            favMenu.removeAt(index);
          });
        }
      else{
        setState(() {
          favMenu.add(
            DUMMY_MEALS.firstWhere((element) {
              return element.id == id;
            })
          );
        });
      }
  }
  bool isFav(String id){
    return favMenu.any((element) => element.id == id);
  }
  @override
  Widget build(BuildContext context) {
    print(filters.isGluttenFree);
    return MaterialApp(
      title: 'Cook Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.yellowAccent,
        canvasColor: Colors.grey[200],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Colors.grey[800],
          ),
          bodyText2: TextStyle(
            color: Colors.grey[800],
          ),
          headline5: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            letterSpacing: 2,
            fontWeight: FontWeight.bold
          ),
        )
      ),
     // home: TabScreen(),
      routes: {
        '/':(ctx){return TabScreen(favMenu);},
        CategoryMenuScreen.routeName:(ctx){return CategoryMenuScreen(availableMenu);},
        MenuDetailScreen.routeName:(ctx){return MenuDetailScreen(isFav,setFav);},
        FiltersScreen.routeName:(ctx){return FiltersScreen(filters,_setFilter);},
      },
    );
  }
}


