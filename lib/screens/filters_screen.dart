import 'package:cook_book/models/filter_model.dart';
import 'package:cook_book/models/menu.dart';
import 'package:cook_book/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'FiltersScreen';
  final Function saveFilters;
  final FilterModel selectedFilters;

  FiltersScreen(this.selectedFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGluttenFree = false;
  var _isLactoseFree= false;
  var _isVegan= false;
  var _isVegetarian= false;

  @override
  initState()
  {
     _isGluttenFree = widget.selectedFilters.isGluttenFree;
     _isLactoseFree= widget.selectedFilters.isLactoseFree;
     _isVegan= widget.selectedFilters.vegan;
     _isVegetarian= widget.selectedFilters.vegetarian;
  }

  Widget _buildSwitchList(String titleText,String subTitle,bool currentVal,Function func)
  {
   return SwitchListTile(title: Text(titleText),subtitle: Text(subTitle),value: currentVal,onChanged: func,);
  }

  @override
  Widget build(BuildContext context) {
    FilterModel currentFilters = FilterModel(isLactoseFree: _isLactoseFree, isGluttenFree: _isGluttenFree, vegan: _isVegan, vegetarian: _isVegetarian);
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(icon: Icon(Icons.save),onPressed:(){
              widget.saveFilters(currentFilters);
            }),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Text(
            'Adjust your meal selection',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchList('Gluten-free','Only Gluten free foods',_isGluttenFree,(newval){
                setState(() {
                  _isGluttenFree = newval;
                });
              }),
              _buildSwitchList('Lactose-free','Only Lactose free foods',_isLactoseFree,(newval){
                setState(() {
                  _isLactoseFree = newval;
                });
              }),
              _buildSwitchList('Only Vegan','Vegan food only',_isVegan,(newval){
                setState(() {
                  _isVegan = newval;
                });
              }),
              _buildSwitchList('Vegetarian','Only Vegetarian food',_isVegetarian,(newval){
                setState(() {
                  _isVegetarian = newval;
                });
              }),
            ],
          ),
        )

      ],
    )
    );
  }
}
