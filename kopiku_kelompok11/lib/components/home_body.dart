
import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/components/product_card.dart';
import 'package:kopiku_kelompok11/models/coffee_model.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {

  final String kategori;
  final ValueSetter<CoffeeModel> valueSetter;
  HomeBody({this.kategori, this.valueSetter});

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {

    final coffees = Provider.of<List<CoffeeModel>>(context);

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                    )
                  ),
                ),

                coffees != null && widget.kategori != null ? ListView.builder(
                  // Banyak data dari produk (kopi)
                  itemCount: coffees.length,
                  itemBuilder: (context,index) => ProductCard(
                    itemIndex: index,
                    coffeeModel: coffees[index],
                    kategori: widget.kategori,
                    press: (){
                      widget.valueSetter(coffees[index]);
                    }
                  )
                ): RaisedButton(onPressed: null)
              ],
            ),
          ),
        ],
      ),
    );
  }
}