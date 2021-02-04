import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/components/home_body.dart';
import 'package:kopiku_kelompok11/models/order_item_model.dart';
import 'package:kopiku_kelompok11/models/coffee_model.dart';
import 'package:kopiku_kelompok11/screens/home/cart_page.dart';
import 'package:kopiku_kelompok11/screens/home/order_page.dart';
import 'package:kopiku_kelompok11/screens/profile/profile_page.dart';
import 'package:kopiku_kelompok11/services/database_service.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> categories = ["All", "Hot", "Cold"];
  List<OrderItemModel> cartSementara = [];

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CoffeeModel>>.value(
      value: DatabaseService().coffees,
      child: DefaultTabController(
        length: categories.length,
        child: Scaffold(
          backgroundColor: Colors.brown,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.brown,
            elevation: 0.0,
            title: Text('Kompiku'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.person), onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()
                  )
                );
              }),
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderPage()
                  )
                );
              })
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: List<Widget>.generate(categories.length, (int index){
                return Tab(text: categories[index]);
              }),
            ),
          ),
          body: TabBarView(
            children: List<Widget>.generate(categories.length, (int index){
              return HomeBody(
                kategori: categories[index],
                valueSetter: (selectedProdact){
                  setState(() {
                    if(cartSementara.isNotEmpty){
                      var hadir = cartSementara.firstWhere((element) => element.id == selectedProdact.id , orElse: () => null);
                      if(hadir == null){
                        cartSementara.add(OrderItemModel(
                          id: selectedProdact.id,
                          title: selectedProdact.title,
                          image: selectedProdact.image,
                          price: selectedProdact.price,
                          totalPrice: selectedProdact.price,
                          totalBarang: 1
                        ));
                      } else {
                        cartSementara.forEach((item) {
                          if(item.id == selectedProdact.id){
                            item.totalPrice = item.totalPrice + selectedProdact.price;
                            item.totalBarang = item.totalBarang + 1;
                            print(item.price.toString());
                          }
                        });
                      }
                    } else{
                      cartSementara.add(OrderItemModel(
                        id: selectedProdact.id,
                        title: selectedProdact.title,
                        image: selectedProdact.image,
                        price: selectedProdact.price,
                        totalPrice: selectedProdact.price,
                        totalBarang: 1
                      ));
                    }
                  });
                  print(cartSementara.length);
                },
              );
            }),
          ),
          floatingActionButton: floatingButton(cartSementara, context),
        ),
      )
    );
  }
}

Widget floatingButton(List cartSementara, BuildContext context){
  if(cartSementara.isNotEmpty){
    return Container(
      height: 72.0,
      width: 72.0,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => CartPage(cart: cartSementara,))
            );
          },
          child: Stack(
            children: <Widget>[
              Icon(Icons.shopping_cart),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    cartSementara.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
