import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kopiku_kelompok11/services/database_service.dart';
import 'package:kopiku_kelompok11/models/order_item_model.dart';

class PagePembayaran extends StatefulWidget {

  final String orderID;
  final int totalHarga;
  PagePembayaran({this.orderID,this.totalHarga});

  @override
  _PagePembayaranState createState() => _PagePembayaranState();
}

class _PagePembayaranState extends State<PagePembayaran> {

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<OrderItemModel>>.value(
      value: DatabaseService(orderID: widget.orderID).orderItems,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Detail Pembayaran"),
          backgroundColor: Colors.brown[400],
        ),
        body: PembayaranBody(orderID: widget.orderID, totalHarga: widget.totalHarga,),
      ),
    );
  }
}

class PembayaranBody extends StatefulWidget {

  final int totalHarga;
  final String orderID;
  PembayaranBody({this.totalHarga,this.orderID});

  @override
  _PembayaranBodyState createState() => _PembayaranBodyState();
}

class _PembayaranBodyState extends State<PembayaranBody> {

  final _formKey = GlobalKey<FormState>();
  final _databaseService = DatabaseService();
  String uang;

  @override
  Widget build(BuildContext context) {

    final orderItems = Provider.of<List<OrderItemModel>>(context);

    if (orderItems != null) {
      return InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom:135),
              color: Color(0xFFDEDEDE),
              child: ListView.builder(
                itemCount: orderItems.length,
                itemBuilder: (context,index){
                  return Container(
                    height: 125,
                    decoration: BoxDecoration(
                      color: Colors.brown[100],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(top: 8,left: 8,right: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.network(
                          orderItems[index].image,
                          height: 125,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 220,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  orderItems[index].title,
                                  style: TextStyle(color: Colors.brown[700],fontSize: 18),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Rp. '+orderItems[index].price.toString(),
                                        style: TextStyle(color: Colors.orange[600]),                              
                                      ),
                                      Spacer(),
                                      Text('x'+orderItems[index].totalBarang.toString())
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ),
            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 0,
              right: 0,
              child: Container(
                height: 135,
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
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Total Harga: Rp. '+widget.totalHarga.toString(),
                        style: TextStyle(color:Colors.white,fontSize: 15),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Masukan Nominal:',
                        style: TextStyle(color:Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.only(top:6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right:6),
                              child: Text(
                                'Rp.',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              margin: EdgeInsets.only(right:6),
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Nominal ..',
                                    fillColor: Colors.brown[200],
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.brown, width: 1.0),
                                    ),
                                    errorStyle: TextStyle(color: Colors.white,backgroundColor: Colors.red)
                                  ),
                                  validator: (val) => 
                                    val.isEmpty ? 'Mohon untuk mengisi nominal pembayaran!' 
                                    : int.parse(val) < widget.totalHarga ? 'Oops! Uang anda tidak cukup :(' 
                                    : null,
                                  onChanged: (val){
                                    setState(() => uang = val);
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                            Container(
                              child: RaisedButton(
                                onPressed: () async{
                                  if(_formKey.currentState.validate()){
                                    await _databaseService.updateStatusOrder(widget.orderID);
                                    await Navigator.pop(context,true);
                                  }
                                  FocusScope.of(context).requestFocus(FocusNode());
                                },
                                color: Colors.white,
                                child: Text(
                                  'Bayar',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ],
        ),
      );
    } else {
      return Text('Anda belum memiliki pesanan');
    }
  }
}
