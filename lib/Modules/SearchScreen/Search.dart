import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Layout/cubit/cubit.dart';
import '../../Layout/cubit/states.dart';
import '../../Shared/Components/Component.dart';
import '../../models/ProductsModel.dart';
import '../../models/getDataNodel.dart';
import '../login/app_colors.dart';

TextEditingController cl =TextEditingController();

class SearchDialog extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    // Get the screen size to make the dialog responsive
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    TextEditingController controller=TextEditingController();
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {


        AppCubit cubit=AppCubit.get(context);
        return Dialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Container(
            height: height*.7,
            width: width*.5,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text(
                //   "Search",
                //   style: TextStyle(fontSize: width * 0.02, fontWeight: FontWeight.bold),
                // ),
                SizedBox(height: 20),
                DefaultTFF(Controller: cl,
                    context: context,
                    Validate: (value) {

                    },
                    PrefixIcon:CupertinoIcons.search,
                    OnChange: (value) {
                      cubit.searchData=[];
                      cubit.getSearch(value);
                    },
                    Label: "Search"),
                SizedBox(height: 10),
                // Replace this ListView with your actual search results ListView
                // For demonstration purposes, I'm just showing an empty ListView.
                Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(1),
                      itemCount:cubit.searchData.length,
                      itemBuilder: (BuildContext context, int index) =>
                          SearchList(height,width,context,cubit.searchData[index],controller),
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(),
                    )
                ),

                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                        // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"),
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

Widget SearchList(height,width,context,GetDataModel model,TextEditingController controller) => Padding(
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
                  Text(
                    "${model.itemName}, " ,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 13 ),
                  ),
                  Text(
                    model.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12 ,color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 3.0,
              ),
              Row(
                children: [
                  Text(
                    " ${model.price.toString()} LE",
                    style: const TextStyle(
                        color: AppColors.mainBlueColor,
                        fontWeight: FontWeight.bold,fontSize: 12),
                  ),
                  // SizedBox(width: 80,),
                ],
              ),
            ],
          ),
        ),

        Container(
          child: Row(
            children: [
              // Text("Quantity "),

              Container(height: height*.03,
                  width:height*.04 ,
                  color: Colors.grey[100],
                  child: Center(child: Text(model.quantity.toString()))
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10,end: 10.0),
          child: IconButton(
            icon: const Icon(Icons.add_circle),
            color: Colors.black,
            onPressed: () {
              showCustomDialog(height,width,context, model,controller);
            },
          ),
        ),
      ],
    ),
  ),
);


void showCustomDialog(height,width,context, GetDataModel model ,TextEditingController controller) =>
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) =>Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          height: height*.35,
          width: width*.1,
          padding: EdgeInsets.all(height*0.02),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height*0.005),
               Text(
                'Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: height*0.04),
              ),
              SizedBox(height: height*.01),
              Row(
                children: [
                  Text(
                    'Name: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: height*0.022,fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: width*.11,
                    child: Text(
                      ' ${model.itemName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: height*0.02),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    ' Price:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: height*0.022,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '  ${model.price} LE',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: height*0.024),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                   Text("Quantity: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: height*0.022,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 30,
                    height: height*0.035,
                    child:  TextField(
                      controller: controller,
                      style: TextStyle(
                          fontSize: 14
                      ),

                      textAlign: TextAlign.center,


                      // Add your TextField properties here
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero, // Remove internal padding
                        border: OutlineInputBorder(),
                        hintText: '1',
                      ),
                    ),
                  ),



                  SizedBox(width: 10),
                ],
              ),

              SizedBox(height: height*0.05,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                      // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                    ),

                    onPressed: () {
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
                      int x=0;
                      int qua=0;
                      if(controller.text==""){
                        x=1;
                        qua=model.quantity-1;
                      }
                      else {
                        x= int.parse(controller.text);
                        qua=model.quantity-int.parse(controller.text);
                      }

                      if(qua>=0){
                        model.quantity=qua;
                        AppCubit.get(context).addToCart(model, x);
                        controller.text="";
                        Navigator.of(context).pop();
                      }
                      else{
                        showToast("Invalid number of quantity..");
                      }

                    },
                    child: Text("Add"),
                  ),
                ],
              ),


            ],
          ),
        ),
      ) ,
      // child: ,
    );


