import 'package:kopiku_kelompok11/component/menuItemCold.dart';
<<<<<<< HEAD
import 'package:kopiku_kelompok11/model/inputgambar_ColdCoffee.dart';
=======
import 'package:kopiku_kelompok11/model/coffeModelCold.dart';
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
import 'package:flutter/material.dart';

class ColdCoffeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: menu2.length,
        itemBuilder: (context, int key) {
          return MenuItemCold(index2: key);
        },
      ),
    );
  }
}
