import 'package:kopiku_kelompok11/model/inputgambar_HotCoffee.dart';
import 'package:flutter/material.dart';
import 'menuItemHot.dart';

class HotCoffeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, int key) {
          return MenuItemHot(index1: key);
        },
      ),
    );
  }
}
