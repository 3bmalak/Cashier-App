import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/Layout/cubit/cubit.dart';
import 'package:untitled1/models/tableViewModel.dart';
import 'package:uuid/uuid.dart';

// late List<Products> h;


class HistoryModel
{
  dynamic username;
  dynamic cartid;
  dynamic totalcost;
  dynamic payed;
   List<Products> data=[] ;
  List<TableViewModel>? products ;
  dynamic date;
  dynamic clientName;
  dynamic clientPhoneNumber;
  dynamic time;

  HistoryModel({
    required this.username,
    required this.cartid,
    required this.products,
    required this.payed,
    required this.totalcost,
    required this.clientName,
    required this.clientPhoneNumber,
    required this.date,
    required this.time,

  });

  HistoryModel.fromJson(dynamic json)
   {
    username= json['username'];
    totalcost= json['totalcost'];
    cartid= json['cartid'];
    payed= json['payed'];
    clientName= json['clientName'];
    date= json['date'];
    clientPhoneNumber= json['clientPhoneNumber'];
    time= json['time'];
  }




  void toMap(context)
  {
    List<Map<String, dynamic>> dataToBeSent=[];
    Map<String, dynamic>? youssef ;
    Map<String, dynamic>? data ;
    youssef={
      'username':username,
      'payed':payed,
      'cartid':cartid,
      'totalcost':totalcost,
      'clientName':clientName,
      'date':date,
      'clientPhoneNumber':clientPhoneNumber,
      'time':time,
    };
    Firestore.instance.collection('ordersHistory').document(cartid).set(youssef);
    // print(products?.length);

    for(int a = 0; a < products!.length; a++){
      data={
        "itemName": products?[a].itemName,
        "quantity": products?[a].quantity,
        "code": products?[a].code,
        "category": products?[a].category,
        "price": products?[a].price,
        "boughtPrice": products?[a].boughtPrice,
      };
      String uniqueId = Uuid().v4();
      Firestore.instance.collection('ordersHistory').document(cartid).collection("orderProducts").document(uniqueId).set(data);


    }


  }
  Map<String, dynamic> toMap2()
  {
    return {
      'cartid':cartid,
      'clientName':clientName,
      'clientPhoneNumber':clientPhoneNumber,
      'date' : date,
      'payed' : payed,
      'time' : time,
      'username' : username,

    };
  }
}



class Products
{
  dynamic category;
  dynamic code;
  dynamic quantity;
  dynamic itemName;
  dynamic price;
  dynamic boughtPrice;

  Products.fromJson(dynamic json)
  {
    category= json['category'];
    code= json['code'];
    itemName= json['itemName'];
    price= json['price'];
    boughtPrice= json['boughtPrice'];
    quantity= json['quantity'];
  }
}