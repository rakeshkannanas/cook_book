import 'package:cook_book/models/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy_food_list.dart';

class MenuDetailScreen extends StatelessWidget {
  static const routeName = 'menu_detail_screen';
  final Function setFav;
  final Function isFav;
  MenuDetailScreen(this.isFav,this.setFav);
  Complexity complexity;
  Affordability affordability;
  String get complexText {
    if (complexity == Complexity.Simple)
      return 'Simple';
    else if (complexity == Complexity.Challenging)
      return 'Challenging';
    else if (complexity == Complexity.Hard)
      return 'Hard';
    else
      return 'Unknown';
  }

  String get affordableText {
    if (affordability == Affordability.Affordable)
      return 'Affordable';
    else if (affordability == Affordability.Pricey)
      return 'Pricey';
    else if (affordability == Affordability.Luxurious)
      return 'Luxurious';
    else
      return 'Unknown';
  }
  @override
  Widget build(BuildContext context) {
    final id = (ModalRoute.of(context).settings.arguments as String);
    final selectedMenu = DUMMY_MEALS.firstWhere((element) => element.id == id);
    complexity = selectedMenu.complexity;
    affordability = selectedMenu.affordability;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMenu.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: selectedMenu.id,
              child: Image.network(
                selectedMenu.imageUrl,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5,),
                      Text('${selectedMenu.duration} mins',)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5,),
                      Text(complexText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.monetization_on),
                      SizedBox(width: 5,),
                      Text(affordableText,)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text('Ingredients',style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Container(
              height: 200,
              width: 350,
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey,width: 1),
                borderRadius: BorderRadius.circular(15)
              ),
              child:  ListView.builder(itemBuilder:(ctx,index){
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                      color: Theme.of(context).accentColor,
                      child: Text(selectedMenu.ingredients[index]),
                    ),
                  );
                } ,itemCount: selectedMenu.ingredients.length,),
              ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text('Steps',style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Container(
              height: 200,
              width: 350,
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey,width: 1),
                  borderRadius: BorderRadius.circular(15)
              ),
              child:  ListView.builder(itemBuilder:(ctx,index)
              {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index+1}'),
                      ),
                      title: Text(selectedMenu.steps[index]),
                    ),
                    Divider(),
                  ],
                );
              } ,itemCount: selectedMenu.steps.length,),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child:
      Icon(isFav(id) ? Icons.star : Icons.star_border),onPressed: (){
        setFav(id);
      },),
    );
  }
}
