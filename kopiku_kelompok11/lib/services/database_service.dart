import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kopiku_kelompok11/models/coffee_model.dart';
import 'package:kopiku_kelompok11/models/order_item_model.dart';
import 'package:kopiku_kelompok11/models/order_model.dart';

class DatabaseService{

  final String uid;
  final String kategori;
  final String orderID;
  DatabaseService({this.uid,this.kategori,this.orderID});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference coffeeCollection = FirebaseFirestore.instance.collection('kopi');
  final CollectionReference orderCollection = FirebaseFirestore.instance.collection('orders');
  final CollectionReference orderItemCollection = FirebaseFirestore.instance.collection('order_items');


  Future updateUserData(String email, String nama) async{
    return await userCollection.doc(uid).set({
      'uid': uid,
      'name': nama,
      'email': email,
    });
  }

  Stream<QuerySnapshot> get users{
    return userCollection.where("uid", isEqualTo: uid).snapshots();
  }

  // [ START -- Mengambil Data Coffee Dari Database]
  List<CoffeeModel> coffeeFromDatabse(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return CoffeeModel(
        id: doc.data()['id_coffee'],
        title: doc.data()['nama_coffee'],
        // description: doc.data()['deskripsi'],
        price: doc.data()['harga_coffee'],
        image: doc.data()['image_url'],
        kategori: doc.data()['type_coffee']
      );
    }).toList();
  }

  Stream<List<CoffeeModel>> get coffees{
    return coffeeCollection.where('type_coffee', isEqualTo: kategori).snapshots().map(coffeeFromDatabse);
  }

  // [ Menambahkan Data Order ]
  Future addOrder(String date, String alamat, int totalPrice, int jumlahBarang, List<OrderItemModel> cartModel) async{
    String orderID = await orderCollection.doc().id.toString();
    return await orderCollection.doc(orderID).set({
      'orderID': orderID,
      'userID' : uid,
      'totalPrice': totalPrice,
      'totalBarang': jumlahBarang,
      'status': 'Menunggu Pembayaran',
      'alamat': alamat,
      'date' : date
    }).whenComplete(() => addOrderItem(cartModel,orderID));
  }

  // [ Mengambil data Orders dari database ]
  List<OrderModel> orderFormDatabase(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return OrderModel(
        orderID: doc.data()['orderID'],
        userID: doc.data()['userID'],
        status: doc.data()['status'],
        totalBarang: doc.data()['totalBarang'],
        totalPrice: doc.data()['totalPrice'],
        alamat: doc.data()['alamat'],
        date: doc.data()['date']
      );
    }).toList();
  }

  Stream<List<OrderModel>> get orders{
    return orderCollection.where('userID', isEqualTo: uid).where('status', isEqualTo: 'Menunggu Pembayaran').snapshots().map(orderFormDatabase);
  }
  
  // [ Menambahkan data Order Item ]
  Future addOrderItem(List<OrderItemModel> cartModel, String orderID) async{
    return await cartModel.forEach((element) {
      String id = orderItemCollection.doc().id.toString();
      orderItemCollection.doc(id).set({
        'orderItemID': id,
        'orderID': orderID,
        'coffeeID': element.id,
        'cTitle': element.title,
        'cImage': element.image,
        'cPrice': element.price,
        'quantity': element.totalBarang,
      });
    });
  }

  List<OrderItemModel> orderItemFromDatabase(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return OrderItemModel(
        id: doc.data()['orderItemID'],
        image: doc.data()['cImage'],
        title: doc.data()['cTitle'],
        price: doc.data()['cPrice'],
        totalBarang: doc.data()['quantity']
      );
    }).toList();
  }

  Stream<List<OrderItemModel>> get orderItems{
    return orderItemCollection.where('orderID', isEqualTo: orderID).snapshots().map(orderItemFromDatabase);
  }

  // Update Status Order
  Future updateStatusOrder(String orderID) async{
    return await orderCollection.doc(orderID).update({
      'status': 'Sedang Diproses'
    });
  }
}