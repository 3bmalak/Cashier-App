import 'dart:math';
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/Shared/Components/constants.dart';
import 'package:untitled1/models/ClientModel.dart';
import 'package:uuid/uuid.dart';
import '../Modules/HistoryScreen/History.dart';
import '../Modules/SideBar/SiedBar.dart';
import '../Modules/login/app_colors.dart';
import '../Modules/login/app_styles.dart';
import '../Shared/Components/Component.dart';
import '../models/HistoryModel.dart';
import '../models/getDataNodel.dart';
import '../models/tableViewModel.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class CashierrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CashierScreen(),
    );
  }
}
dynamic paid=0;
dynamic remainder="";
class CashierScreen extends StatelessWidget {
  final List<String> columnHeaders = ['Item Name', 'Category', 'Weight', 'Price', 'Discount',"Count",'Delete'];


  TextEditingController phone = TextEditingController();
  TextEditingController payController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  bool x=false;
  bool y=false;
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width  =  MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

        if(state is ScanLoadingState){
          x=true;
        }
        else {
          x=false;
        }
        if(state is ScanLoading2State){
          y=true;
        }
        else {
          y=false;
        }
      },
      builder: (context, state) {


      AppCubit cubit=AppCubit.get(context);
        return Scaffold(
          body: Column(
            children: [



              Expanded(
                child: Container(
                  color: Colors.grey[400],
                  child: Row(
                    children: [
                      FixedSidebar(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height:height *.045,),

                            Row(children: [
                            // Spacer(),
                              SizedBox(width:width*0.67 ,),
                            Container(
                              height: height*.045,
                              width: width*.1,
                              // color: Colors.orange[700],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [


                                  Center(
                                    child: Text(
                                      AppCubit.get(context).moneyAmount.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: height*width*0.00002,
                                        color: CupertinoColors.white
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.mainBlueColor,

                              border: Border.all(
                                  color: Colors.black, // Specify the border color
                                  width: 2.0, // Specify the border width
                                ),
                              ),


                            )
                            // Image(image: AssetImage("assets/images/log12.png"),height: height*0.1,)
                          ],),
                            SizedBox(height:height *.01,),

                            Container(
                              width: width*0.77,
                              color: Colors.white,
                              height: height*.65,

                              child: Column(
                                children: [
                                  Container(
                                    width:width*0.77,
                                    padding: const EdgeInsets.all(10),

                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: width*.1,
                                          height: height*.04,
                                          // color: Colors.white,
                                          child: TextField(
                                            controller: phone,
                                            style: const TextStyle(
                                                fontSize: 14
                                            ),

                                            textAlign: TextAlign.center,
                                            // Add your TextField properties here
                                            decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              contentPadding: EdgeInsets.zero, // Remove internal padding
                                              border: OutlineInputBorder(),
                                              hintText: 'Phone Number',
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: width*.01,),
                                        Container(
                                          height:  height*.04,
                                          width: width*.04,

                                          child:
                                          x?
                                          const Center(
                                            child: SizedBox(height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainBlueColor),
                                              ),
                                            ),
                                          )
                                              :ElevatedButton(

                                            onPressed: () {
                                              if(phone.text=="" || phone.text=="0"){
                                                AppCubit.get(context).scanPhoneNumber("0");
                                              }
                                              else{
                                                AppCubit.get(context).scanPhoneNumber(phone.text);
                                              }
                                            },
                                            child: Center(child: Text("Scan",style: TextStyle(fontSize: width*0.008),)),
                                            style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                                              alignment: Alignment.centerLeft, // You can change the alignment as per your requirement
                                              backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                              // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                            ),
                                          ),
                                        ),
                                        // Spacer(),
                                        SizedBox(width:width*.007),
                                        Container(
                                          height:  height*.04,
                                          width: width*.07,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                                              alignment: Alignment.centerLeft, // You can change the alignment as per your requirement
                                              backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                              // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                            ),


                                            onPressed: () {
                                              TextEditingController clientNameController = TextEditingController();
                                              TextEditingController numberController = TextEditingController();
                                              TextEditingController offerController = TextEditingController();
                                              TextEditingController convictedController = TextEditingController();
                                              TextEditingController emailController = TextEditingController();
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                return LayoutBuilder(
                                                  builder: (BuildContext context, BoxConstraints constraints) {
                                                    // final maxWidth = constraints.maxWidth;
                                                    // final maxHeight = constraints.maxHeight;
                                                    // final dialogWidth = maxWidth > 600 ? 600 : maxWidth - 40;
                                                    // final dialogHeight = maxHeight > 800 ? 800 : maxHeight - 40;
                                                    return AlertDialog(

                                                      title: Text('Add Client'),
                                                      content: Container(
                                                        width: width*.25,
                                                        height: height*.42,
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(5.0),
                                                              child: Container(
                                                                width: width*.24,
                                                                height: height*.07,

                                                                child: TextFormField(
                                                                  controller: clientNameController,

                                                                  decoration: InputDecoration(labelText: 'Client Name',
                                                                    border:OutlineInputBorder(

                                                                      borderRadius: BorderRadius.circular(5),
                                                                      borderSide: BorderSide(
                                                                          color: Colors.green
                                                                      ),
                                                                    ),),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(5.0),
                                                              child: Container(
                                                                width: width*.24,
                                                                height: height*.07,
                                                                child: TextFormField(

                                                                  controller: emailController,
                                                                  decoration: InputDecoration(labelText: 'Email',
                                                                    border:OutlineInputBorder(

                                                                      borderRadius: BorderRadius.circular(5),
                                                                      borderSide: BorderSide(
                                                                          color: Colors.green
                                                                      ),
                                                                    ),),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(5.0),
                                                              child: Container(
                                                                width: width*.24,
                                                                height: height*.07,
                                                                child: TextFormField(

                                                                  controller: numberController,
                                                                  decoration: InputDecoration(labelText: 'Phone Number',
                                                                    border:OutlineInputBorder(

                                                                      borderRadius: BorderRadius.circular(5),
                                                                      borderSide: BorderSide(
                                                                          color: Colors.green
                                                                      ),
                                                                    ),),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(5.0),
                                                              child: Container(
                                                                width: width*.24,
                                                                height: height*.07,
                                                                child: TextFormField(
                                                                  controller: offerController,
                                                                  decoration: InputDecoration(labelText: 'Offer',
                                                                    border:OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      borderSide: BorderSide(
                                                                          color: Colors.green
                                                                      ),
                                                                    ),),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(5.0),
                                                              child: Container(
                                                                width: width*.24,
                                                                height: height*.07,
                                                                child: TextFormField(
                                                                  controller: convictedController,

                                                                  decoration: InputDecoration(labelText: 'Convicted',
                                                                    border:OutlineInputBorder(

                                                                      borderRadius: BorderRadius.circular(5),
                                                                      borderSide: BorderSide(
                                                                          color: Colors.green
                                                                      ),
                                                                    ),),
                                                                  // maxLines: 5,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                            backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                                            // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                                          ),

                                                          onPressed: () async {
                                                            ClientModel model=ClientModel(name: clientNameController.text, offer: offerController.text, phoneNumber: numberController.text, convicted: convictedController.text, email: emailController.text);
                                                            AppCubit.get(context).addNewClient(model);

                                                          },
                                                          child: Text('Add'),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                                              // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                                            ),

                                                            onPressed: () {
                                                              // Cancel button onPressed action
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: Text('Cancel'),
                                                          ),
                                                        ),
                                                      ],
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(
                                                          Radius.circular(16.0),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                               }
                                              );
                                            },

                                            child: Center(child: Text("New Client",style: TextStyle(fontSize: width*0.008),)),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          height:  height*.04,
                                          width: width*.07,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                                              alignment: Alignment.centerLeft, // You can change the alignment as per your requirement
                                              backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                              // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                            ),


                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) => HistoryDialog(),
                                              );
                                            },

                                            child: Center(child: Text("History",style: TextStyle(fontSize: width*0.008),)),
                                          ),
                                        ),

                                      ],),
                                  ),


                                  Container(
                                    // width: width/1.3 ,
                                    width: width*0.77,
                                    padding: const EdgeInsets.only(left: 5.0,right: 5),
                                    height: height*.57,
                                    color: Colors.grey[200],
                                    child: cubit.cart2.length!=0?
                                    SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child:  DataTable(
                                        dataTextStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black
                                        ),
                                        headingRowHeight: 40,
                                        dataRowHeight: 40,
                                        dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white70), // Set the header row color here
                                        dividerThickness: 2, // Set the thickness of the vertical and horizontal dividers
                                        columns: buildDataColumns(columnHeaders),
                                        rows:  buildDataRows(context,cubit.cart2),
                                      )
                                    ):
                                    Center(
                                       child: Text(
                                           "Empty !",
                                            style: TextStyle(fontSize: width*.03,fontWeight: FontWeight.bold),
                                       ),
                                    ),

                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: width*0.77,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: height*.04,
                                    width: width*0.08,
                                    color: Colors.grey[300],
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("total cost  ",style: TextStyle(fontSize: width*0.008),),
                                        Text(AppCubit.get(context).totalCost.toStringAsFixed(1),style: TextStyle(fontWeight: FontWeight.bold,fontSize: width*0.01),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton:
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: width*.22,),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    paidcontroller.text="";
                    phonecontroller.text="";
                    showDialog(
                      context: context,
                      // barrierDismissible: false,
                      builder: (context) =>Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          height: height*.47,
                          width: width*.1,
                          padding: EdgeInsets.all(20),

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Center(
                                child: const Text(
                                  'Payment',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              ),
                              
                              SizedBox(height: height*.03),


                              const Text("Phone number ",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Container(
                                    width: width*.11,
                                    height: height*0.05,
                                    child:  TextField(
                                      controller: phonecontroller,
                                      style: TextStyle(
                                          fontSize: 18
                                      ),

                                      textAlign: TextAlign.center,

                                      onSubmitted: (value) {
                                        AppCubit.get(context).scanPhoneNumber2(phonecontroller.text);


                                      },

                                      // Add your TextField properties here
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero, // Remove internal padding
                                        border: OutlineInputBorder(),
                                        // hintText: '1',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                 y? const Center(
                                   child: SizedBox(height: 20,
                                     width: 20,
                                     child: CircularProgressIndicator(
                                       valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainBlueColor),
                                     ),
                                   ),
                                 ):
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(5)),
                                        minimumSize: MaterialStateProperty.all<Size>(Size(height*0.08, height*0.058)),
                                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                      // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                    ),

                                    onPressed: () {
                                      AppCubit.get(context).scanPhoneNumber2(phonecontroller.text);

                                    },
                                    child: Text("Scan"),
                                  ),


                                ],
                              ),
                              SizedBox(height: 20),
                              Row(children: [
                                Text("Remainder : "),
                                SizedBox(width: 20,),
                                AppCubit.get(context).client2!=null? Text(AppCubit.get(context).client2!.convicted.toString(),
                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),):Text("0")
                              ],),

                              SizedBox(height: 20),
                              const Text("Paid: ",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                              SizedBox(height: 5,),
                              Container(
                                width: width*.2,
                                height: height*0.05,
                                child:  TextField(
                                  controller: paidcontroller,
                                  style: TextStyle(
                                      fontSize: 18
                                  ),

                                  textAlign: TextAlign.center,


                                  // Add your TextField properties here
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero, // Remove internal padding
                                    border: OutlineInputBorder(),
                                    // hintText: '1',
                                  ),
                                ),
                              ),



                              SizedBox(width: 10),

                              SizedBox(height: 20,),
                              Spacer(),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                      // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                    ),

                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  SizedBox(width: width*.01,),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                      // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                    ),

                                    onPressed: (){
                                      print(double.parse(paidcontroller.text.toString()));
                                      print("int.parse(payController.text.toString())");

                                      print(AppCubit.get(context).client2?.convicted.runtimeType);

                                      if(AppCubit.get(context).client2!=null) {
                                        AppCubit.get(context).client2?.convicted-=double.parse(paidcontroller.text.toString());
                                        AppCubit.get(context).editConvisted2(paidcontroller.text.toString());
                                        showToast("Payment Successfully");


                                      }
                                      else {
                                        showToast("InValid Phone Number");
                                      }

                                    },
                                    child: Text("Pay"),
                                  ),
                                ],
                              ),


                            ],
                          ),
                        ),
                      ) ,
                      // child: ,
                    );

                  },
                  borderRadius: BorderRadius.circular(16.0),
                  child: Ink(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 18.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: AppColors.mainBlueColor,
                    ),
                    child: Text(
                      "Add Payment",
                      style: ralewayStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.whiteColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),

              Spacer(),

              DefaultButton(
                text: "Check Out",
                function: ()
                {
                  if( AppCubit.get(context).cart2.length==0){
                    showToast("EMPTY CART !!");
                  }
                  else {
                    if (phone.text == "" || phone.text == "0") {
                      AppCubit.get(context).scanPhoneNumber("0");
                    }
                    else {
                      AppCubit.get(context).scanPhoneNumber(phone.text);
                    }
                    double cost=0;
                    if(AppCubit.get(context).found) {
                      cost = AppCubit.get(context).payingCost;
                    }
                    else
                    {
                      cost = AppCubit.get(context).totalCost;

                    }

                    payController.text="";
                    discountController.text="";
                    showCustomDialog(
                        height, width, context, payController, phone.text,discountController,cost);
                  }
                  // AppCubit.get(context).saveHistory(userData?.name.toString(), uniqueId, 250, AppCubit.get(context).totalCost,"sofa","01200393020");

                  // print(formattedTime);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  List<DataColumn> buildDataColumns(List<String> columnHeaders) {
    return columnHeaders
        .map((header) => DataColumn(label: Text(header)))
        .toList();
  }

  List<DataRow> buildDataRows(BuildContext context, List<TableViewModel> rowData) {
    return rowData.asMap().entries.map((entry) {
      int index = entry.key;
      TableViewModel data = entry.value;
      dynamic p=data.price;
      // print(data.notes==null);
      // data.notes="dawaaaa";
      // print(data.notes==null);

      return DataRow(
        cells: [
          DataCell(
          data.notes!=null?
            Tooltip(
              message: data.notes.toString(),
              child: Row(
                children: [
                  Container(
                    height:20,
                    width:20,
                    // c
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(Icons.question_mark_outlined,size: 13,color: Colors.blue,)),
                  SizedBox(width: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.19,
                    child: Text(data.itemName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize:MediaQuery.of(context).size.width*.008 ),
                    ),
                  ),
                ],
              ),
            ) : Container(
            width: MediaQuery.of(context).size.width * 0.19,
            child: Text(data.itemName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize:MediaQuery.of(context).size.width*.008 ),
            ),
          ),
          ),
          DataCell(
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(data.category,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize:MediaQuery.of(context).size.width*.008 ),),
            ),
          ),
          DataCell(
            Text(data.itemWeight.toString()+"  "+data.weightUnit.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize:MediaQuery.of(context).size.width*.008 ),
          ),
          ),
          DataCell(
              Text(
              data.isChecked && data.discountPrice!="" ?  (data.discountPrice*data.quantity).toString():(data.price*data.quantity).toString() )),
          DataCell(
            Checkbox(
              value: data.isChecked,
              onChanged: (value) {
                data.isChecked=value!;
                AppCubit.get(context).changeState();

                if(data.isChecked){
                  if(data.discountPrice!=""){
                    AppCubit.get(context).totalCost-=(data.price*int.parse(data.quantity.toString())-data.discountPrice*int.parse(data.quantity.toString()));
                  }
                }
                else{
                  AppCubit.get(context).totalCost+=(data.price*int.parse(data.quantity.toString())-data.discountPrice*int.parse(data.quantity.toString()));
                  AppCubit.get(context).changeState();

                }
                AppCubit.get(context).changeState();



              },
            ),
          ),
          DataCell(
            Container(
              width: 30,
              height: 30,
              child: TextField(
                controller: TextEditingController(text: data.quantity.toString()),
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,

                onSubmitted: (value) {
                  int x=0;
                  int qua=0;

                 bool b= AppCubit.get(context).changeQuantity(data,data.quantity,int.parse(value));
                 if(b){
                   data.quantity = int.parse(value);
                   AppCubit.get(context).recalculateTotalCost();
                 }


                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(),
                  hintText: '1',
                ),
              ),
            ),
          ),
          DataCell(
            IconButton(
              icon: Icon(Icons.delete, color: Colors.redAccent),
              onPressed: () {
                // Delete the row when the delete button is pressed
                AppCubit.get(context).changeState();
                AppCubit.get(context).removeFromCart(data,data.quantity);
                AppCubit.get(context).improveQuantity(data);
                rowData.removeAt(index);
                AppCubit.get(context).changeState();
              },
            ),
          ),
        ],
      );
    }).toList();
  }
}

void showCustomDialog(height,width,context ,TextEditingController controller,phone,TextEditingController controller2,cost) =>

    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) {

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            height: height*.50,
            width: width*.1,
            padding: EdgeInsets.all(20),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.015),
                Center(
                  child: const Text(
                    'Payment',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                SizedBox(height: height*.03),

                Row(
                  children: [
                    Text(
                      ' Total Cost: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${cost.toStringAsFixed(1)} LE',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: height*0.018),
                 const Row(
                   children: [
                     Text("Discount: ",
                      textAlign: TextAlign.center,
                      style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                     Spacer(),
                     Text("(optional)",
                       textAlign: TextAlign.center,
                       style:TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                   ],
                 ),

                SizedBox(height: height*0.008),

                Container(
                  width: width*.2,
                  height: height*0.06,
                  child:  TextField(
                    controller: controller2,
                    style: TextStyle(
                        fontSize: 15
                    ),

                    onSubmitted: (value) {
                      print(value);
                      if(AppCubit.get(context).pere){
                        cost=cost-((double.parse(value.toString())/100)*cost);
                      }
                      else{
                        cost-=double.parse(value.toString());
                      }
                      print(cost);
                      AppCubit.get(context).changeState();

                    },


                    // Add your TextField properties here
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20), // Remove internal padding
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(onPressed: () {
                        AppCubit.get(context).changePere();

                      }, icon: Icon(AppCubit.get(context).pere?Icons.percent:Icons.currency_pound))
                      // hintText: '1',
                    ),


                  ),
                ),

                SizedBox(height: height*0.018),
                const Text("Paid: ",
                  textAlign: TextAlign.center,
                  style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: height*0.008),
                Container(
                  width: width*.2,
                  height: height*0.06,
                  child:  TextField(
                    controller: controller,
                    style: TextStyle(
                        fontSize: 15
                    ),

                    textAlign: TextAlign.center,


                    // Add your TextField properties here
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero, // Remove internal padding
                      border: OutlineInputBorder(),
                      // hintText: '1',
                    ),
                  ),
                ),

                Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                        // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                      ),

                      onPressed: ()
                      {
                        controller.text="";
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                    SizedBox(width: width*.01,),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                        // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                      ),

                      onPressed: () {


                        paid=int.parse(controller.text);
                        print(paid);
                        Navigator.of(context).pop();
                        DateFormat formatter = DateFormat('dd/MM/yyyy');
                        String formattedDate = formatter.format(DateTime.now());
                        DateFormat fo= DateFormat('HH:mm a');
                        String formattedTime = fo.format(DateTime.now());
                        DateTime now = DateTime.now();
                        double d=0;
                        controller.text="";
                        d=cost;


                        
                        String cartid = Uuid().v4();
                        print(cartid);
                        if(d>paid){
                          AppCubit.get(context).client!.convicted+=double.parse((d-paid).toStringAsFixed(1));
                          print( "AppCubit.get(context).client!.convicted");
                          print( AppCubit.get(context).client!.convicted);
                          print( "AppCubit.get(context).client!.convicted");
                          AppCubit.get(context).editConvisted();
                          AppCubit.get(context).detailedC(paid, double.parse((d-paid).toStringAsFixed(1)), d,cartid);


                        }

                        AppCubit.get(context).saveHistory(paid,context,cartid,cost);
                        AppCubit.get(context).moneyAmount+=double.parse(paid.toString());



                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) =>
                              Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Container(
                                  height: height*.6,
                                  width: width*.2,
                                  padding: EdgeInsets.all(20),

                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(height: 12),
                                      Center(
                                        child: const Text(
                                          'Order Details',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                      ),
                                      SizedBox(height: height*.03),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            ' Cashier: ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            userData?.name,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(),
                                          ),
                                          // SizedBox(width: width*.03),


                                        ],
                                      ),
                                      SizedBox(height: 20,),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            ' Date:',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            formattedDate,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(),
                                          ),
                                          SizedBox(width: width*.02),
                                          Text(
                                            'Time: ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            formattedTime,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(),
                                          ),

                                        ],
                                      ),
                                      SizedBox(height: height*.03),
                                      SizedBox(height: height*.03),
                                      Row(children: [
                                        Text(
                                          'Item',
                                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Price',
                                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                        ),

                                      ],),
                                      SizedBox(height: height*.01),

                                      Expanded(
                                          child: ListView.separated(
                                            padding: const EdgeInsets.all(1),
                                            itemCount:AppCubit.get(context).cart2.length,
                                            itemBuilder: (BuildContext context, int index) =>
                                                invoiceList(height,width,context,AppCubit.get(context).cart2[index],cost),
                                            separatorBuilder: (BuildContext context, int index) =>
                                                Container(width: width*0.2,
                                                  height:1,
                                                  color: Colors.grey,),
                                          )
                                      ),
                                      Container(width: width*0.2,
                                        height:2,
                                        color: Colors.grey,),
                                      SizedBox(height: 10,),

                                      Row(
                                        children:
                                        [
                                          Text(
                                            'Total',
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            '${AppCubit.get(context).totalCost.toStringAsFixed(1)} LE',
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      SizedBox(height: 20,),
                                      Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                              // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                            ),

                                            onPressed: () {
                                              AppCubit.get(context).cart2=[];
                                              AppCubit.get(context).totalCost=0;
                                              AppCubit.get(context).changeState();
                                              Navigator.of(context).pop();



                                            },
                                            child: Text("Cancel"),
                                          ),
                                          SizedBox(width: 20,),
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                              // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                            ),

                                            onPressed: () {
                                              AppCubit.get(context).cart2=[];
                                              AppCubit.get(context).totalCost=0;
                                              AppCubit.get(context).changeState();
                                              Navigator.of(context).pop();


                                            },
                                            child: Text("Print"),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ) ,
                          // child: ,
                        );
                        // showCustomDialog2(height, width, context);

                      },
                      child: Text("Pay"),
                    ),
                  ],
                ),


              ],
            ),
          ),
        );
      } ,
      // child: ,
    );


Widget invoiceList(height,width,context,TableViewModel model,cost) => Container(
  child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height*0.01,),

    Text(
      '${model.quantity.toString()}x',
      style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
    ),

    Row(children: [
      Text(
        model.itemName.toString(),
        style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
        overflow: TextOverflow.ellipsis,
      ),
      Spacer(),

      Text(cost.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),)
    ],),
    SizedBox(height: height*0.01,)

  ]),
);



