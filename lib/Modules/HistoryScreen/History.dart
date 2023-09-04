import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/Modules/HistoryScreen/Linechart.dart';
import 'package:untitled1/models/HistoryModel.dart';
import '../../Layout/cubit/cubit.dart';
import '../../Layout/cubit/states.dart';
import '../../Shared/Components/Component.dart';
import '../../models/ProductsModel.dart';
import '../../models/getDataNodel.dart';
import '../login/app_colors.dart';


TextEditingController c =TextEditingController();
TextEditingController controlleruser=TextEditingController();
TextEditingController phonecontroller=TextEditingController();
TextEditingController paidcontroller=TextEditingController();
TextEditingController controllerclient=TextEditingController();
TextEditingController controllerstart=TextEditingController();
TextEditingController controllerend=TextEditingController();

final List<String> columnHeaders = ['Item Name', 'Category',  'Price', "Quantity",'Code'];

class HistoryDialog extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // Get the screen size to make the dialog responsive
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        AppCubit cubit=AppCubit.get(context);
        return Dialog(

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Container(
            height: height*.8,
            width: width*.6,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 15,),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("UserName: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                            // SizedBox(width: width*.05),
                            Container(
                              width: width*0.1,
                              height: 30,
                              child: TextField(
                                controller: controlleruser,
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,

                                onSubmitted: (value) {

                                },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(),
                                  hintText: '',
                                ),
                              ),
                            ),
                      ],
                    ),
                        SizedBox(width: width*.01),
                        Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Client Name: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                SizedBox(height: 5,),
                                Container(
                                  width:width*0.1,
                                  height: 30,
                                  child: TextField(
                                    controller: controllerclient,
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,

                                    onSubmitted: (value) {

                                    },
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(),
                                      hintText: '',
                                    ),
                                  ),
                                ),

                              ],
                            ),
                        SizedBox(width: width*.01),


                        Row(
                              children: [
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Start Date ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                    SizedBox(height: 5,),
                                    Container(
                                      width: width*0.1,
                                      height: 30,
                                      child: TextField(
                                        controller: controllerstart,
                                        style: TextStyle(fontSize: 14),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.datetime,
                                        onTap: () {
                                          showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now() ,
                                              firstDate: DateTime.parse('2023-05-03'),
                                              lastDate: DateTime.now()
                                          ).then((value) {
                                            DateFormat formatter = DateFormat('dd/MM/yyyy');
                                            String formattedDate = formatter.format(value!);
                                            print(formattedDate);
                                            controllerstart.text=formattedDate;
                                          });
                                        },

                                        onSubmitted: (value) {

                                        },
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            border: OutlineInputBorder(),
                                            hintText: 'DD/MM/YYYY',
                                            hintStyle: TextStyle(fontSize: 12)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: width*.01),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("End Date: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                    SizedBox(height: 5,),
                                    Container(
                                      width: width*0.1,
                                      height: 30,
                                      child: TextField(
                                        controller: controllerend,
                                        style: TextStyle(fontSize: 14),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.datetime,
                                        onTap: () {
                                          showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now() ,
                                              firstDate: DateTime.parse('2023-05-03'),
                                              lastDate: DateTime.now()
                                          ).then((value) {
                                            DateFormat formatter = DateFormat('dd/MM/yyyy');
                                            String formattedDate = formatter.format(value!);
                                            print(formattedDate);
                                            controllerend.text=formattedDate;
                                          });
                                        },


                                        onSubmitted: (value) {

                                        },
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            border: OutlineInputBorder(),
                                            hintText: 'DD/MM/YYYY',
                                            hintStyle: TextStyle(fontSize: 12)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                      ],
                    ),
                    SizedBox(width: width*0.008),
                    Container(
                      height:  height*.04,
                      width: width*.05,
                      child: ElevatedButton(


                        onPressed: () {
                          // AppCubit.get(context).getHistory();


                          List<String> s=[
                            controlleruser.text,
                            controllerclient.text,
                            controllerstart.text,
                            controllerend.text
                          ];
                          cubit.filterHistory(s);
                        },
                        child: Center(child: Text("Filter",style: TextStyle(fontSize: width*0.009),)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed

                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                          alignment: Alignment.centerLeft, // You can change the alignment as per your requirement
                          // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                        ),
                      ),
                    ),
                    SizedBox(width: width*0.005),
                    Container(
                      height:  height*.04,
                      width: width*.05,
                      child: ElevatedButton(

                        onPressed: () {
                            controlleruser.text="";
                            controllerclient.text="";
                            controllerstart.text="";
                            controllerend.text="";

                        },
                        child: Center(child: Text("Clear",style: TextStyle(fontSize: width*0.009),)),
                        style: ButtonStyle(

                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                          alignment: Alignment.centerLeft, // You can change the alignment as per your requirement
                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                          // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 10),

                Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(1),
                      itemCount:cubit.d.length,
                      itemBuilder: (BuildContext context, int index) =>
                         HistoryList(height,width,context,cubit.d[index]),
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(),
                    )
                ),

                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Container(
                            height:  height*.04,
                            width: width*.05,
                            child: ElevatedButton(

                              onPressed: () {
                                double profit=0;
                                for ( var i in AppCubit.get(context).d){
                                  double totalBought=0;
                                  for(var j in i.data){
                                    totalBought+=j.boughtPrice;
                                  }
                                  print(totalBought);
                                  profit+=(i.totalcost-totalBought);

                                }

                                showProfit(height,width,context,profit.toStringAsFixed(1));



                              },
                              child: Center(child: Text("Profit",style: TextStyle(fontSize: width*0.009),)),
                              style: ButtonStyle(

                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                                alignment: Alignment.centerLeft, // You can change the alignment as per your requirement
                                backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Container(
                            height:  height*.04,
                            width: width*.05,
                            child: ElevatedButton(

                              onPressed: () {
                                showDialog(
                                    context: context,
                                    // barrierDismissible: false,
                                    builder: (context) =>
                                    Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Container(
                                        color: Color(0xFF1B2339),
                                        height: height*.8,
                                        width: width*.6,
                                        padding: EdgeInsets.all(20),

                                        child: Column(
                                          children: [
                                            LineChartSample2(controllerstart.text,controllerend.text),
                                            Spacer(),
                                            Container(
                                              width: width*0.1,
                                              height: height*0.05,
                                              child: ElevatedButton(

                                                onPressed: (){
                                                  Navigator.pop(context);

                                                },
                                                child: Center(child: Text("Back",style: TextStyle(fontSize: width*0.01,color: AppColors.mainBlueColor,fontWeight: FontWeight.bold),)),
                                                style: ButtonStyle(

                                                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                                                  alignment: Alignment.centerLeft, // You can change the alignment as per your requirement
                                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Customize the button color if needed
                                                  // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                                ),
                                              ),
                                            ),
                                            Spacer(),

                                          ],
                                        ),
                                      ),
                                    ),
                                );


                              },
                              child: Center(child: Text("Statistics",style: TextStyle(fontSize: width*0.009),)),
                              style: ButtonStyle(

                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                                alignment: Alignment.centerLeft, // You can change the alignment as per your requirement
                                backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [
                          Container(
                            height:  height*.04,
                            width: width*.05,
                            child: ElevatedButton(

                              onPressed: () {
                                Navigator.pop(context);

                              },
                              child: Center(child: Text("Cancel",style: TextStyle(fontSize: width*0.009),)),
                              style: ButtonStyle(

                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                                alignment: Alignment.centerLeft, // You can change the alignment as per your requirement
                                backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        );
      },
    );
  }
}

Widget HistoryList(height,width,context,HistoryModel model) => Padding(
  padding: const EdgeInsets.all(7.0),
  child: Container(
    height: MediaQuery.of(context).size.height*.06,
    width: double.infinity,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), //color of shadow
        spreadRadius: 1, //spread radius
        blurRadius: 5, // blur radius
        offset: const Offset(0, 1), // changes position of shadow
      ),
    ], borderRadius: BorderRadius.circular(10.0), color: Colors.white),
    child: Row(
      children: [
        const Padding(
          padding:
          EdgeInsetsDirectional.only(start: 15.0, end: 15.0),
          child: Icon(
            Icons.wysiwyg_outlined,
            size:18,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width:width *.08,

                    child: Text(
                      "Cashier: ${model.username}" ,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12 ),
                    ),
                  ),
                  SizedBox(
                    width: width*.02,
                  ),
                  Container(
                    width:width *.08,

                    child: Text(
                      "Client name : ${model.clientName}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12 ),
                    ),
                  ),
                  SizedBox(                    width: width*.02,
                  ),
                  Container(
                    width:width *.066,

                    child: Text(
                      "Date : ${model.date}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12 ),
                    ),
                  ),
                  SizedBox(                    width: width*.02,
                  ),
                  Container(
                    width:width *.08,

                    child: Text(
                      " total cost : ${model.totalcost.toString()} LE",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: width*.02,
                  ),
                  Container(
                    width:width *.05,

                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "Paid ${model.payed.toString()} LE",
                      style: const TextStyle(
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 3.0,
              // ),
            ],
          ),
        ),


        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10,end: 10.0),
          child: IconButton(
            icon: const Icon(Icons.details_outlined),
            color: Colors.black,
            onPressed: () {
              showCustomDialog(height,width,context, model);
            },
          ),
        ),
      ],
    ),
  ),
);


void showCustomDialog(height,width,context, HistoryModel model ) =>
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) =>
          Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          height: height*.8,
          width: width*.6,
          padding: EdgeInsets.all(20),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 12),
              const Text(
                'Order Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: height*.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' Cashier:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${model.username} ',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  SizedBox(width: width*.03),
                  Text(
                    ' Client Name:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${model.clientName}',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  SizedBox(width: width*.03),
                  Text(
                    ' Total Cost:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${model.totalcost} LE',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  SizedBox(width: width*.03),
                  const Text(
                    ' Paid:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${model.payed} LE',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  SizedBox(width: 12),

                ],
              ),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' Client Phone Number:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${model.clientPhoneNumber} ',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  SizedBox(width: width*.03),
                  Text(
                    ' Date:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${model.date}',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  SizedBox(width: width*.03),
                  Text(
                    ' time:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${model.time}',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ],
              ),
              SizedBox(height: height*.03),
              const Text(
                'Products',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: height*.03),

              Container(
                // width: width/1.3 ,
                width: width*0.56,
                padding: const EdgeInsets.only(left: 5.0,right: 5),
                height: height*.4,
                color: Colors.grey[200],
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child:  DataTable(
                      dataTextStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black
                      ),
                      headingRowHeight: 30,
                      dataRowHeight: 30,
                      dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white70), // Set the header row color here
                      dividerThickness: 2, // Set the thickness of the vertical and horizontal dividers
                      columns: buildDataColumns(columnHeaders),
                      rows:  buildDataRows(context,model.data),
                    )
                )
            ,

              ),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),

                ],
              ),
            ],
          ),
        ),
      ) ,
      // child: ,
    );



List<DataColumn> buildDataColumns(List<String> columnHeaders) {
  return columnHeaders
      .map((header) => DataColumn(label: Text(header)))
      .toList();
}

List<DataRow> buildDataRows(BuildContext context, List<Products> rowData) {
  return rowData.asMap().entries.map((entry) {
    int index = entry.key;
    Products data = entry.value;
    dynamic p=data.price;
    // print(data.notes==null);
    // data.notes="dawaaaa";
    // print(data.notes==null);

    return DataRow(
      cells: [
        DataCell(
          Container(
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
        DataCell(Text(data.price.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize:MediaQuery.of(context).size.width*.008 ),
        ),
        ),
        DataCell(Text(data.quantity.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize:MediaQuery.of(context).size.width*.008 ),
        ),
        ),
        DataCell(
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 8.0),
            child: Text(data.code.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize:MediaQuery.of(context).size.width*.008 ),
        ),
          ),
        ),

      ],
    );
  }).toList();
}






void showProfit(height,width,context,profit ) =>
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) =>
          Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              height: height*.2,
              width: width*.2,
              padding: EdgeInsets.all(width*height*0.0000005),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 12),
                   Text(
                    'Net profits',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: width*height*0.00002),
                  ),
                  SizedBox(height: height*.02),
                  Container(
                    height: height*.05,
                    width: width*.15,
                    // color: Colors.deepOrangeAccent,
                    child: Center(
                      child: Text(
                        "$profit LE"
                      ,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width*height*0.00002
                      ),
                      ),

                    ),
                  ),
                  SizedBox(height: height*.02),

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

                    ],
                  ),
                ],
              ),
            ),
          ) ,
      // child: ,
    );
