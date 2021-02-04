import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/models/order_item_model.dart';
import 'package:kopiku_kelompok11/services/database_service.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {

  final List<OrderItemModel> cart;
  CartPage({this.cart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  int allPrice = 0;
  int allProduct = 0;
  final String uid = FirebaseAuth.instance.currentUser.uid.toString();
  DatabaseService _databaseService;

  final _formKey = GlobalKey<FormState>();

  // Text Field
  String alamat = '';

  @override
  Widget build(BuildContext context) {
    
    DateTime now = DateTime.now();
    String currentDateTime = DateFormat('EEEE, d MMM yyyy').format(now);
      
    Size size = MediaQuery.of(context).size;
    if(allPrice == 0 || allProduct == 0){
      widget.cart.forEach((element) {
        allPrice = allPrice + element.totalPrice;
        allProduct = allProduct + element.totalBarang;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Pesanan"),
      ),
      body: _getBody(size,currentDateTime)
    );
  }

  Widget _getBody(Size size, String currentDateTime) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 150),
          child: ListView.builder(
          itemCount: widget.cart.length,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          bottomRight: Radius.circular(22)
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: ClipRRect(
                            child: Image.network(
                              widget.cart[index].image,
                              width: 160.0,
                              height: 110.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.add_circle,color: Colors.brown),
                              onPressed: (){
                                setState(() {
                                  allPrice = allPrice + widget.cart[index].price;
                                  allProduct = allProduct + 1;
                                  widget.cart[index].totalBarang = widget.cart[index].totalBarang + 1;
                                  widget.cart[index].totalPrice = widget.cart[index].totalPrice + widget.cart[index].price;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.remove_circle,color: Colors.brown),
                              onPressed: () {
                                setState(() {
                                  allPrice = allPrice - widget.cart[index].price;
                                  allProduct = allProduct - 1;
                                  if(widget.cart[index].totalBarang == 1){
                                    widget.cart.removeWhere((element) => element.id == widget.cart[index].id);
                                  }
                                  else{
                                    widget.cart[index].totalBarang = widget.cart[index].totalBarang - 1;
                                    widget.cart[index].totalPrice = widget.cart[index].totalPrice - widget.cart[index].price;
                                  }
                                });
                              },
                            ),
                          ]
                        ),
                      ],
                    ),
                  ),

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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              widget.cart[index].title,
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                            child: Text('Quantity: ${widget.cart[index].totalBarang}',style: TextStyle(fontSize: 16.0),),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.yellow[800],
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(22),
                                topLeft: Radius.circular(22)
                              )
                            ),
                            child: Text(
                              "Rp. ${widget.cart[index].price}",
                              style: Theme.of(context).textTheme.button,
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 0,
          right: 0,
          child: Container(
          height: 145,
          decoration: BoxDecoration(
            color: Colors.brown,
            boxShadow: [
              BoxShadow(
                offset: Offset(0,-15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15)
              )
            ]
          ),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Alamat pengiriman ..',
                    fillColor: Colors.brown[200],
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 1.0),
                    ),
                    errorStyle: TextStyle(color: Colors.white,backgroundColor: Colors.red)
                  ),
                  validator: (val) => val.isEmpty ? 'Mohon untuk mengisi alamat pengiriman!' : null,
                  onChanged: (val){
                    setState(() => alamat = val);
                  }
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Total Harga: Rp. ${allPrice.toString()}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: RaisedButton(
                      onPressed: () async{
                        if(_formKey.currentState.validate()){
                          _databaseService = DatabaseService(uid: uid);
                          await _databaseService.addOrder(currentDateTime,alamat,allPrice,allProduct,widget.cart);
                          await setState(() {
                            widget.cart.clear();
                            Navigator.pop(context,true);
                          });
                        }
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      color: Colors.white,
                      child: Text(
                        'Pesan',
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
          ),
        ),
      ]),
    );
  }
}