import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/models/order_model.dart';
import 'package:kopiku_kelompok11/screens/home/page_pembayaran.dart';
import 'package:kopiku_kelompok11/services/database_service.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final String uid = FirebaseAuth.instance.currentUser.uid.toString();

    return StreamProvider<List<OrderModel>>.value(
      value: DatabaseService(uid: uid).orders,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown,
          elevation: 0.0,
          title: Text('Orders'),
        ),
        body: OrdersBody(),
      ),
    );
  }
}

class OrdersBody extends StatefulWidget {
  @override
  _OrdersBodyState createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {

  @override
  Widget build(BuildContext context) {

    final orders = Provider.of<List<OrderModel>>(context);
    
    return Scaffold(
      backgroundColor: Color(0xdedede),
      body: orders != null ? ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context,index){
          return orders[index].status == 'Menunggu Pembayaran' ? Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 192,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('ID pesanan : ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Text(orders[index].orderID)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Status pesanan : ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Text(orders[index].status)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Total barang : ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Text(orders[index].totalBarang.toString())
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Total harga : ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Text('Rp. '+orders[index].totalPrice.toString(),style: TextStyle(color: Colors.red))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Di pesan pada : ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Text(orders[index].date)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Alamat pengiriman : ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Text(orders[index].alamat)
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top:8),
                        child: Row(
                          children: [
                            Spacer(),
                            RaisedButton.icon(
                              color: Colors.orange,
                              icon: Icon(Icons.payments),
                              label: Text('Bayar Pesanan'),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PagePembayaran(orderID: orders[index].orderID, totalHarga: orders[index].totalPrice))
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ): null;
        }
      ): Text('Anda belum memiliki pesanan'),
    );
  }
}

