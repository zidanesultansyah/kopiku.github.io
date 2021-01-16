import 'package:kopiku_kelompok11/component/menuItemCold.dart';
import 'package:kopiku_kelompok11/model/coffeModelCold.dart';
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
