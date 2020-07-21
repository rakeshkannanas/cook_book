import 'package:cook_book/models/menu.dart';
import 'package:cook_book/screens/menu_detail_screen.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final String id;
  final String title;
  final int duration;
  final String imgurl;
  final Complexity complexity;
  final Affordability affordability;

  MenuItem({@required this.id,
    @required this.title,
    @required this.duration,
    @required this.imgurl,
    @required this.complexity,
    @required this.affordability});

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  String get complexText {
    if (widget.complexity == Complexity.Simple)
      return 'Simple';
    else if (widget.complexity == Complexity.Challenging)
      return 'Challenging';
    else if (widget.complexity == Complexity.Hard)
      return 'Hard';
    else
      return 'Unknown';
  }

  String get affordableText {
    if (widget.affordability == Affordability.Affordable)
      return 'Affordable';
    else if (widget.affordability == Affordability.Pricey)
      return 'Pricey';
    else if (widget.affordability == Affordability.Luxurious)
      return 'Luxurious';
    else
      return 'Unknown';
  }

  void menuTap(BuildContext context) {
    Navigator.of(context).pushNamed(MenuDetailScreen.routeName,
        arguments:widget.id).then((value){
              setState(() {
              });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => menuTap(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Hero(
                    tag: widget.id,
                    child: Image.network(widget.imgurl, height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.all(10),
                    child: Text(widget.title, style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                      softWrap: true,
                      overflow: TextOverflow.fade,),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5,),
                      Text('${widget.duration} mins',)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5,),
                      Text(complexText,)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.monetization_on),
                      SizedBox(width: 5,),
                      Text(affordableText,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
