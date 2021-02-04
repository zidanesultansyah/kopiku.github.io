import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/models/coffee_model.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.itemIndex,
    this.coffeeModel,
    this.kategori,
    this.press
  }) : super(key: key);

  final int itemIndex;
  // Data produk (kopi)
  final CoffeeModel coffeeModel;
  final Function press;

  final String kategori;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return kategori == "All" || coffeeModel.kategori == kategori ? IniCard(coffeeModel: coffeeModel, size: size, press: press,) : Container();
  }
}

class IniCard extends StatelessWidget {
  const IniCard({
    Key key,
    @required this.coffeeModel,
    @required this.size,
    @required this.press,
  }) : super(key: key);

  final CoffeeModel coffeeModel;
  final Size size;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // color: Colors.blueAccent,
      height: 160,
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Card Background
            Container(
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.yellow[800],
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.4),
                    spreadRadius:8,
                    blurRadius:18,
                  )
                ],
              ),
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22)
                ),
              ),
            ),

            // Product Image
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    coffeeModel.image,
                    width: 160.0,
                    height: 110.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            // Product detail
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: 136,
                // Our
                width: size.width - 208,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        coffeeModel.title,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 5,
                      ),
                      margin: EdgeInsets.only(right: 9),
                      decoration: BoxDecoration(
                        color: Colors.yellow[800],
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(22),
                          topLeft: Radius.circular(22)
                        )
                      ),
                      child: Text(
                        "RP. ${coffeeModel.price}",
                        style: Theme.of(context).textTheme.button,
                      )
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}