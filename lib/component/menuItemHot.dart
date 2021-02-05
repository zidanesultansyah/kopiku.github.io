<<<<<<< HEAD
import 'package:kopiku_kelompok11/model/inputgambar_HotCoffee.dart';
import 'package:kopiku_kelompok11/detailPageHot.dart';
=======
import 'package:kopiku_kelompok11/model/coffeeModelHot.dart';
import 'package:kopiku_kelompok11/detailPage.dart';
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
import 'package:flutter/material.dart';

class MenuItemHot extends StatelessWidget {
  final int index1;

  MenuItemHot({this.index1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                index: index1,
                              )));
                },
                child: Row(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          menu[index1].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            menu[index1].name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            menu[index1].shortDesc,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Rp. " + menu[index1].price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
<<<<<<< HEAD
=======
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.brown[600],
                  size: 36,
                ),
              )
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
            ],
          ),
        ),
      ),
    );
  }
}
<<<<<<< HEAD
=======

>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
