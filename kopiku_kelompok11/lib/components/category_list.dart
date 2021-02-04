import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/components/home_body.dart';

class Categories extends StatefulWidget {

  final Function klikKat;
  Categories({this.klikKat});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["All", "Hot Coffee", "Cold Coffee", "What else","asdasd"];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            setState(() {
              selectedIndex = index;
              return HomeBody();
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.0,right: index == categories.length - 1 ? 20.0 : 0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: index == selectedIndex ? Colors.white.withOpacity(0.4) : Colors.transparent,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Text(
              categories[index],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}