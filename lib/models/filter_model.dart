import 'package:flutter/cupertino.dart';

class FilterModel{
  final bool isGluttenFree;
  final bool isLactoseFree;
  final bool vegan;
  final bool vegetarian;

  FilterModel({@required this.isLactoseFree,@required this.isGluttenFree,@required this.vegan,@required this.vegetarian});
}