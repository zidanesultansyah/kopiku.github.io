import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/model/coffeModelOrther.dart';
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
