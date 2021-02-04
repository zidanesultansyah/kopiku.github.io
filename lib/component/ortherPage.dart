import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:kopiku_kelompok11/model/inputgambar_OrtherCoffee.dart';
=======
import 'package:kopiku_kelompok11/model/coffeModelOrther.dart';
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
import 'package:kopiku_kelompok11/component/menuItemOrther.dart';

class OrtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: menu3.length,
        itemBuilder: (context, int key) {
          return MenuItemOrther(index3: key);
        },
      ),
    );
  }
}
