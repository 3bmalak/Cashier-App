
import 'dart:convert';

import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/Layout/cubit/states.dart';
import 'package:untitled1/Shared/Components/Component.dart';
import 'package:untitled1/Shared/Components/constants.dart';
import 'package:untitled1/models/ClientModel.dart';
import 'package:uuid/uuid.dart';


import '../../googleSheet.dart';
import '../../models/HistoryModel.dart';
import '../../models/ProductsModel.dart';
import '../../models/getDataNodel.dart';
import '../../models/ss.dart';
import '../../models/tableViewModel.dart';





class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);


int count =1;

void increaseCount(){
    count++;
    emit(increaseSuccessfulystate());
  }

  List<GetDataModel> allData=[];
void getItemToUpdate(GetDataModel model){
  for(var i in allData){
    if (i.itemName==model.itemName){
      if(i.code==model.code){
        i=model;
        emit(DataLoadingState());

      }
    }
  }
}

void getFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    emit(DataLoadingState());


    await Firestore.instance.collection('data').get().then((page)
    {
      var documents = page.toList();
      for (var document in documents) {
        allData.add(GetDataModel.fromJson(document));
        // print(allData[0].itemName);
        // print('Document: ${document.map}');
        emit(RowAddedSuccessfulState());

      }
      emit(DataSuccessfulState());


    });

  }


List<HistoryModel> historyData=[];

Future<void> getHistory() async {
  WidgetsFlutterBinding.ensureInitialized();
  emit(HistoryDataLoadingState());
  historyData=[];


  await Firestore.instance.collection('ordersHistory').get().then((page)
  async {
    var documents = page.toList();
    for (var document in documents) {
      HistoryModel s=HistoryModel.fromJson(document);
      // print(s.date);

      await Firestore.instance.collection('ordersHistory').document(s.cartid).collection("orderProducts").get().then((page)
      {
        var documents = page.toList();
        for (var document in documents) {
          s.data.add(Products.fromJson(document));
        }
      });
       historyData.add(s);
      // emit(HistoryRowAddedSuccessfulState());
    }
    emit(HistoryDataSuccessfulState());
  });
  getMoneySholudPay();
}


Future<void> detailedC(paid,different,cost,cartID)
async {
bool x=false;
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  String date = formatter.format(DateTime.now());


try{
      await Firestore.instance
          .collection('clients')
          .document(client?.phoneNumber)
          .collection("moneyPerDate")
          .document(date.toString())
          .get()
          .then((page) async {
        SSS s = SSS.fromJson(page);
        s.money += different;
        s.totalCost += cost;
        s.paid += paid;
        Firestore.instance
            .collection('clients')
            .document(client?.phoneNumber)
            .collection("moneyPerDate")
            .document(date.toString())
            .update(s.toMap())
            .then((value) {
          emit(HistoryRowAddedSuccessfulState());
          print("date found");
          x = true;
        });



      });
    }
catch (e){

  await Firestore.instance.collection('clients').document(client?.phoneNumber).collection("moneyPerDate").document(date.toString()).set(
      {
        "date":date,
        "money":different,
        "totalCost":cost,
        "paid":paid,
        "cartID":cartID
      }).then((value) {
        print("sssssssssssssssssss");
        emit(HistoryDataSuccessfulState());

  });

}


}


  Future<void> SignUp(email,name,password,phoneNumber) async {
    await FirebaseAuth.instance.signUp(email, password).then((value) async {
      RegExp regExp = RegExp(r'localId:\s*(\S+),');
      Match? match = regExp.firstMatch(value.toString());
      String UId ="";
      if (match != null) {
        UId = match.group(1)!;
        print(UId); // Output: 49DKffIvwGMUJLmqqokCUKNFayw2
      } else {
        print('localId not found');
      }

      Firestore.instance.collection("users").document(UId.toString()).set({

        "UId":UId,
        "email":email,
        "name":name,
        "password":password,
        "phoneNumber":phoneNumber,

      }).then((value)
      {
        print("doneee");
        GoogleSheet().sendEmailPassword(email, password);
        showToast("Added Successfully");
      });


    }).catchError((onError){
      showToast("Error");
    });
  }

  void decreaseCount()
  {
    count--;
    emit(decreaseSuccessfulystate());
  }

  List<GetDataModel> cart=[];
  List<TableViewModel> cart2=[];

  double totalCost=0;
  double payingCost=0;

  void addToCart(GetDataModel model,int q)
  {
    bool x= false;
    for(var i in cart2)
      {
        if(model.itemName==i.itemName){
          i.quantity+=q;
          recalculateTotalCost();
          emit(ProductAddedSuccessfulState());
          x=true;
        }
      }
    if(x==false){
    cart.add(model);
    cart2.add(
        TableViewModel(
            model.code,
            model.itemWeight,
            model.weightUnit,
            model.category,
            model.price,
            model.discountPrice,
            model.itemName,
            q,
            model.isChecked,
          model.boughtPrice,
          model.notes,
        )
    );
    totalCost+=int.parse(model.price.toString())*q;
    emit(ProductAddedSuccessfulState());
    }

  }

  bool changeQuantity(model, int old,int New){

    for(var i in allData){
      if(i.itemName==model.itemName){
        if(old>New)
        {
          i.quantity-=(New-old);
          emit(changeQuantitySuccessfulState());

          return true;
        }
        else if(old<New)
        {
          int x= i.quantity + (old - New);

        if(x>=0)
          {
            i.quantity=x;
            emit(changeQuantitySuccessfulState());

            return true;

          }
        else{
          showToast("InValid number of quantity");
          emit(changeQuantitySuccessfulState());

          return false;
        }
        }


      }
    }
    return false;
  }

  void improveQuantity(TableViewModel model,){
    //
    for(var i in allData){
      if(i.itemName==model.itemName){
        i.quantity+=model.quantity;
        break;

      }  }
    }


  void removeFromCart(TableViewModel model,int q) {
    // cart.remove(model);
    cart2.remove(TableViewModel(model.code,
        model.itemWeight,
        model.weightUnit,
        model.category,
        model.price,
        model.discountPrice,
        model.itemName,
        q,
        model.isChecked,
      model.boughtPrice,
      model.notes,

    ));

    totalCost-=int.parse(model.price.toString())*q;
    emit(ProductRemovedSuccessfulState());

  }

  void recalculateTotalCost(){
    totalCost=0;
    for(var i in cart2){
      totalCost+=i.price*i.quantity;
      emit(recalculateTotalCostSuccessfulState());

    }
  }



  void changeState(){
    emit(SearchSuccessfulState());
  }

  String selectedOption="User Name";

  void changeDropDown(s){
    selectedOption=s;
    emit(SearchSuccessfulState());
  }

  DateTime parseDateString(String dateString) {
    List<int> parts = dateString.split('/').map(int.parse).toList();
    return DateTime(parts[2], parts[1], parts[0]);
  }

  List<HistoryModel> d=[];
 void filterHistory(List<String> s) {
print(historyData.length);
   d=[];
   List<DateTime> allDays = [];

   if(s[2]!="" && s[3]!="") {
     DateTime startDate = parseDateString(s[2]);
     DateTime endDate = parseDateString(s[3]);
     for (var date = startDate; date.isBefore(endDate) ||
         date.isAtSameMomentAs(endDate); date = date.add(Duration(days: 1))) {
       allDays.add(date);
     }

   }

  if(s[0]!="" && s[1]!="" && s[2]!="" && s[3]!=""){
    for(var i in historyData){
        if (s[0] == i.username && s[1]==i.clientName) {
          for (var day in allDays) {
            DateFormat formatter = DateFormat('dd/MM/yyyy');
            String formattedDate = formatter.format(day);
            if (i.date==formattedDate) {
              d.add(i);
              emit(DataLoadingState());
              // print(formattedDate);
            }
          }
        }
    }
  }

  else if(s[0]=="" &&s[1]!="" &&s[2]!="" &&s[3]!=""){
    for(var i in historyData){
      if (s[1]==i.clientName) {
        for (var day in allDays) {
          DateFormat formatter = DateFormat('dd/MM/yyyy');
          String formattedDate = formatter.format(day);
          if (i.date==formattedDate) {
            d.add(i);
            emit(DataLoadingState());
            // print(formattedDate);
          }
        }
      }
    }
  }

  else if(s[0]=="" &&s[1]=="" &&s[2]!="" &&s[3]!=""){
    for(var i in historyData){
        for (var day in allDays) {
          DateFormat formatter = DateFormat('dd/MM/yyyy');
          String formattedDate = formatter.format(day);
          if (i.date==formattedDate) {
            d.add(i);
            emit(DataLoadingState());
            // print(formattedDate);
          }
        }

    }

  }

  else if(s[0]!="" &&s[1]!="" &&s[2]=="" &&s[3]==""){
    for(var i in historyData){
      if (s[0] == i.username && s[1]==i.clientName) {
            d.add(i);
            emit(DataLoadingState());
      }
    }

  }

  else if(s[0]!="" &&s[1]=="" &&s[2]!="" &&s[3]!=""){
    for(var i in historyData){
      if (s[0] == i.username ) {
        for (var day in allDays) {
          DateFormat formatter = DateFormat('dd/MM/yyyy');
          String formattedDate = formatter.format(day);
          if (i.date==formattedDate) {
            d.add(i);
            emit(DataLoadingState());
            // print(formattedDate);
          }
        }
      }
    }

  }

  else if(s[0]!="" &&s[1]=="" &&s[2]=="" &&s[3]==""){
    for(var i in historyData){
      if (s[0] == i.username ) {
        d.add(i);
        emit(DataLoadingState());
      }
    }

  }

  else if(s[0]=="" && s[1]!="" && s[2]=="" && s[3]==""){
    for(var i in historyData){
      print(i.clientName);
      if (s[1]==i.clientName) {
        print("sssss");
        d.add(i);
        emit(DataLoadingState());
      }
    }

  }
emit(DataLoadingState());

 }


  List<GetDataModel> searchData =[];

  void getSearch(data) {
    for (var ss in allData) {
      if (ss.itemName.toLowerCase().contains(data.toLowerCase())) {
        searchData.add(ss);
        emit(SearchSuccessfulState());

      }
    }
  }

  Future<void> saveHistory(payed,context,cartid,cost) async {
      DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(DateTime.now());
     DateFormat fo= DateFormat('HH:mm a');
    String formattedTime = fo.format(DateTime.now());

    for (var i in cart2)
      {
        print(i.boughtPrice);
        if(i.isChecked==true&& i.discountPrice!=null){
          i.price=i.discountPrice;
        }
      }

    HistoryModel s=HistoryModel(username: userData?.name, cartid: cartid, products: cart2, payed: payed, totalcost: cost, date: formattedDate,clientName: client?.name,clientPhoneNumber:client?.phoneNumber ,time:formattedTime );
    s.toMap(context);
      await getHistory();
      editQuantity(cart2);
    isChecked=false;
    found=false;


      emit(historyAddedSuccessfully());
  }


  String barCodeRes="";
  Future<void> ScanBarcode() async{

    await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE
    ).then((value){
      print(value);
      barCodeRes=value.toString();
      emit(ScannedSuccessfulystate());
    }
    ).catchError((onError){
      print(onError.toString());
      barCodeRes="Erorr!!!";
      emit(ScannedErrorstate());

    });

  }

  Future<void> signUp(String email, String password,String name,phoneNumber) async {

      await FirebaseAuth.instance.signUp(email, password).
      then(( value) {

        RegExp regExp = RegExp(r'localId:\s*(\S+),');
        Match? match = regExp.firstMatch(value.toString());
        String UId ="";
        if (match != null) {
          UId = match.group(1)!;
          print(UId); // Output: 49DKffIvwGMUJLmqqokCUKNFayw2
        } else {
          print('localId not found');
        }

        print(value);

        Firestore.instance.collection("users").document(UId.toString()).set({
          "name":name,
          "phoneNumber":phoneNumber,
          "email":email,
          "password":password,
          "UId":UId,

        });

        print(value);
      }).catchError((onError){
        print(onError.toString());
      });
      print('User created with email $email');

  }


  void editQuantityInFirebase(List){

  }

  void addNewClient(ClientModel model){
    emit(NewClientAddedLoadingState());

    Firestore.instance.collection("clients").document(model.phoneNumber.toString()).set(model.toMap()).then((value) {
      emit(NewClientAddedSuccessfulState());

      showToast("Client Added Successfully!");
    }).catchError((onError){
      print(onError.toString());
    });


  }


  ClientModel? client;
  Future<void> scanPhoneNumber(String phone) async {
    client=null;
    emit(ScanLoadingState());

    await Firestore.instance.collection('clients').get().then((page)
    async {
      var documents = page.toList();
      for (var document in documents) {
        ClientModel s=ClientModel.fromJson(document);
        if(s.phoneNumber.toString()==phone){
          client=s;
          if(phone=="" || phone=="0"){
            showToast("Default phone number");
          }
          else {
            showToast("Valid phone number");
          }
          emit(ScanSuccessfulState());
          break;

        }

      }
      if(client==null){
       await Firestore.instance.collection('clients').document("0").get().then((value) {
          ClientModel s=ClientModel.fromJson(value);
          client=s;
          print(client?.name);


        });
        showToast("inValid phone number");
        emit(ScanSuccessfulState());
      }
    });
  }

  ClientModel? client2;
  Future<void> scanPhoneNumber2(String phone) async {
    client2=null;
    emit(ScanLoading2State());
    print(phone);


    await Firestore.instance.collection('clients').get().then((page)
    async {
      var documents = page.toList();
      for (var document in documents) {
        ClientModel s=ClientModel.fromJson(document);
        if(s.phoneNumber.toString()==phone){
          client2=s;

            showToast("Valid phone number");

          emit(ScanSuccessfulState());
          break;

        }

      }
      if(client2==null){

        showToast("inValid phone number");
        emit(ScanSuccessfulState());
      }

    });
  }

  Future<void> editConvisted() async {
    await Firestore.instance.collection("clients").document(client!.phoneNumber.toString()).update(client!.toMap()).then((value) {
      emit(OneItemEditedSuccessfulState());
    });
  }






  Future<void> editConvisted2(paidcontroller) async {
    double paid=double.parse(paidcontroller);
    List<String> dateList=[];

  try{
    await Firestore.instance
        .collection('clients')
        .document(client?.phoneNumber)
        .collection("moneyPerDate")
        .get().then((value) {
        dateList=[];
        dynamic documents=value.toList();

        for(var document in documents){
          SSS s =SSS.fromJson(document);
         dateList.add(s.date);
        print("ssssssssssss");
    }
        emit(GetAllDaysForPaySuccessfulState());
    });

    // Convert string dates to DateTime objects
    if(dateList.length!=1) {
      DateFormat formatter = DateFormat('dd-MM-yyyy');
      List<DateTime> dateTimes = dateList.map((date) => formatter.parse(date)).toList();
      dateTimes.sort();
      List<String> sortedDateStrings = dateTimes.map((date) => formatter.format(date)).toList();
      dateList=[];
      dateList=sortedDateStrings;
      sortedDateStrings.forEach((date) => print(date));
      emit(DaysSortedSuccessfulState());
    }
    int h=0;

  for(var i in dateList){
    print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    print(i);
    print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
      await Firestore.instance
          .collection('clients')
          .document(client?.phoneNumber)
          .collection("moneyPerDate")
          .document(i).get().then((value) async {
            emit(GetDocSuccessfulState());
            SSS s=SSS.fromJson(value);

            dynamic shouldBePaid=s.totalCost-s.money;
            print(paid);
            print(s.money);
            if(paid==s.money){
              paid-=s.money;
             await Firestore.instance
                  .collection('clients')
                  .document(client?.phoneNumber)
                  .collection("moneyPerDate")
                  .document(i).delete().then((value) async
             {
               await Firestore.instance
                   .collection('ordersHistory')
                   .document(s.orderID).get().then((value) async {
                  HistoryModel history=HistoryModel.fromJson(value);
                  history.payed+=s.money;
                  await Firestore.instance
                      .collection('ordersHistory')
                      .document(s.orderID).update(history.toMap2()).then((value)
                  {
                  getHistory();
                  });
               });

             });
              emit(DocEditedSuccessfulState());
            }
            else{
              s.money-=paid;
              s.paid+=paid;
              await Firestore.instance
                  .collection('clients')
                  .document(client?.phoneNumber)
                  .collection("moneyPerDate")
                  .document(i).update(s.toMap()).then((value) async {

                await Firestore.instance
                    .collection('ordersHistory')
                    .document(s.orderID).get().then((value) async
                {
                  HistoryModel history=HistoryModel.fromJson(value);
                  history.payed+=paid;
                  await Firestore.instance
                      .collection('ordersHistory')
                      .document(s.orderID).update(history.toMap2()).then((value)
                  {
                    getHistory();
                  });
                });
              });
              emit(DocEditedSuccessfulState());

              h=1;
            }

      });
      if(h==1){
        break;
      }

    }
    emit(DocEditedSuccessfulState());

  }
    catch (e){
    print(";;;;;;;;;;;;");
    }

    await Firestore.instance.collection("clients").document(client2!.phoneNumber.toString()).update(client2!.toMap()).then((value) {
      emit(OneItemEditedSuccessfulState());
    });
  }

  Future<void> editQuantity(List<TableViewModel> d) async {
    for(var s in d){
      for(var x in allData){
        if(x.code==s.code){
          await Firestore.instance.collection("data").document(x.code.toString()).update(x.toMap()).then((value) {
            emit(OneItemEditedSuccessfulState());
          });
          break;
        }

      }
    }

  }


  bool isPasswordIconChecked=true;
  void ChangePasswordVisability(){
    isPasswordIconChecked =! isPasswordIconChecked;
    emit(isPasswordIconCheckedLoginState());
  }

  double moneyAmount=0;
  bool isChecked=false;
  bool found=false;

  void s(bool value){
    isChecked=value;
    changeState();
  }

  List<SSS> moneyShouldPay=[];
  Future<void> getMoneySholudPay() async {
    moneyShouldPay=[];
    await Firestore.instance
        .collection("clients")
        .get().then((value) async {
          dynamic x =value.toList();
          for (var i in x){
            ClientModel oo=ClientModel.fromJson(i);
            print(oo.phoneNumber);
           if(oo.phoneNumber.toString()!="0")
           {
              try {
                await Firestore.instance
                    .collection("clients")
                    .document(oo.phoneNumber)
                    .collection("moneyPerDate")
                    .get()
                    .then((value2) {
                  dynamic y = value2.toList();
                  for (var l in y) {
                    SSS ssss = SSS.fromJson(l);
                    ssss.ClientPhoneNumber=oo.phoneNumber;
                    ssss.ClientName=oo.name;
                    moneyShouldPay.add(ssss);
                  }
                });
                emit(GetDepthSuccessfullyState());

              }
              catch (e) {
                print("not d");
              }
        }
      }
    });


    moneyShouldPay.sort((a, b) => DateFormat('dd-MM-yyyy').parse(a.date)
        .compareTo(DateFormat('dd-MM-yyyy').parse(b.date)));
    emit(GetDepthSuccessfullyState());

  }

  bool notification=false;

  bool pere=true;
  void changePere(){
    pere=!pere;
    emit(ChangePerecentageSuccessfullyState());
  }
}

