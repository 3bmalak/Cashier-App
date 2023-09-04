import 'package:firedart/firedart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Layout/cubit/cubit.dart';
import 'package:untitled1/Modules/HistoryScreen/History.dart';
import 'package:untitled1/Modules/login/login_screen.dart';
import 'package:untitled1/models/getDataNodel.dart';
import '../../Shared/Components/Component.dart';
import '../../Shared/Components/constants.dart';
import '../../models/ss.dart';
import '../SearchScreen/Search.dart';
import '../login/app_colors.dart';

const String password="#Akram123";
class FixedSidebar extends StatelessWidget {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemCategoryController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController weightUnitController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountPriceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController itemCodeController = TextEditingController();
  TextEditingController boughtPriceCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController c1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    AppCubit cubit=AppCubit.get(context);

    return Container(
      width: width*0.19,
      color: AppColors.mainBlueColor,

      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.00,),
            Text("Welcome",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
            Text(userData!.name.toString().split(" ")[0],style: TextStyle(fontSize: 20,color: Colors.white),),
            SizedBox(height: 20),
            MaterialButton(
              height: height*0.06,
              onPressed: () {
                cl.text="";
                AppCubit.get(context).searchData=[];
                // AppCubit.get(context).searchData=[];

                showDialog(
                  context: context,
                  builder: (context) => SearchDialog(),
                );
              },
              minWidth: double.infinity,
              child: Row(children: [
                Icon(Icons.search,color: Colors.white,size: width*0.014,),
                SizedBox(width: 20,),
                Text("Search",style: TextStyle(color: Colors.white,fontSize: width*0.01),)
              ],
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              height: height*0.06,
              onPressed: () {
                AppCubit.get(context).isPasswordIconChecked=true;

                passController.text="";

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return AlertDialog(

                          title: Text('Enter Password'),
                          content: Container(
                            width: width*.2,
                            height: height*.09,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: height*.07,

                                    child: TextFormField(
                                      controller: passController,
                                      obscureText: cubit.isPasswordIconChecked,
                                      onFieldSubmitted: (value) {

                                        if(passController.text==password){
                                          Navigator.of(context).pop();
                                          showToast("Welcome Admin ");
                                          passController.text="";

                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return LayoutBuilder(
                                                builder: (BuildContext context, BoxConstraints constraints) {
                                                  return AlertDialog(

                                                    title: Text('Add User'),
                                                    content: Container(
                                                      width: width*.22,
                                                      height: height*.5,
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.all(10.0),
                                                            child: Container(
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
                                                            padding: const EdgeInsets.all(10.0),
                                                            child: Container(
                                                              height: height*.07,

                                                              child: TextFormField(
                                                                controller: nameController,

                                                                decoration: InputDecoration(labelText: 'Name',
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
                                                            padding: const EdgeInsets.all(10.0),
                                                            child: Container(
                                                              height: height*.07,

                                                              child: TextFormField(
                                                                controller: passwordController,

                                                                decoration: InputDecoration(labelText: 'Password',
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
                                                              height: height*.07,

                                                              child: TextFormField(
                                                                controller: phonecontroller,

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

                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      ElevatedButton(
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
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                                          // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                                        ),
                                                        onPressed: () async {
                                                          // Add button onPressed action
                                                          cubit.SignUp(emailController.text, nameController.text, passwordController.text, mobileController.text);
                                                          emailController.text="";
                                                          nameController.text="";
                                                          passwordController.text="";
                                                          mobileController.text="";
                                                          cubit.changeState();
                                                          Navigator.of(context).pop();
                                                        },

                                                        child: Text('Add'),
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
                                            },
                                          );

                                        }
                                        else if(passController.text=='') {
                                          showToast("Password must not be empty ");

                                        }
                                        else{
                                          showToast("Wrong Password .... Please try again  ");


                                        }
                                      },


                                      decoration: InputDecoration(labelText: 'Password',
                                        prefixIcon:Icon(Icons.lock_outline_rounded),

                                        suffixIcon: IconButton(
                                          onPressed: (){
                                            // print(object)
                                            cubit.ChangePasswordVisability();
                                          },
                                          icon: Icon(
                                            cubit.isPasswordIconChecked ? Icons.remove_red_eye:Icons.visibility_off_sharp,
                                          ),
                                        ),

                                        border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.green
                                          ),
                                        ),),
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
                              onPressed: () {
                                // Cancel button onPressed action
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                  // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                ),
                                onPressed: () async {
                                  if(passController.text==password){
                                    Navigator.of(context).pop();

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return LayoutBuilder(
                                          builder: (BuildContext context, BoxConstraints constraints) {
                                            return AlertDialog(

                                              title: Text('Add User'),
                                              content: Container(
                                                width: width*.22,
                                                height: height*.47,
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: Container(
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
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: Container(
                                                        height: height*.07,

                                                        child: TextFormField(
                                                          controller: nameController,

                                                          decoration: InputDecoration(labelText: 'Name',
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
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: Container(
                                                        height: height*.07,

                                                        child: TextFormField(
                                                          controller: passwordController,

                                                          decoration: InputDecoration(labelText: 'Password',
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
                                                        height: height*.07,

                                                        child: TextFormField(
                                                          controller: phonecontroller,

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

                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                ElevatedButton(
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
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                                    // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                                  ),
                                                  onPressed: () async {
                                                    // Add button onPressed action
                                                   cubit.SignUp(emailController.text, nameController.text, passwordController.text, mobileController.text);
                                                   emailController.text="";
                                                   nameController.text="";
                                                   passwordController.text="";
                                                   mobileController.text="";
                                                   cubit.changeState();
                                                    Navigator.of(context).pop();
                                                  },

                                                  child: Text('Add'),
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
                                      },
                                    );
                                  }
                                  else if(passController.text=='') {
                                    showToast("Password must not be empty ");

                                  }
                                  else{
                                    showToast("Wrong Password .... Please try again  ");


                                  }
                                },

                                child: const Text('Continue '),
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
                  },

                );




              },

              minWidth: double.infinity,
              child: Row(children: [
                Icon(Icons.person_add_alt_1_outlined,color: Colors.white,size: width*0.014,),
                SizedBox(width: 20,),
                Text("Add User",style: TextStyle(color: Colors.white,fontSize: width*0.01),)
              ],
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              height: height*0.06,
              onPressed: () {
                AppCubit.get(context).isPasswordIconChecked=true;

                passController.text="";
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return AlertDialog(

                          title: Text('Enter Password'),
                          content: Container(
                            width: width*.2,
                            height: height*.09,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: height*.07,

                                    child: TextFormField(
                                      controller: passController,
                                      obscureText: cubit.isPasswordIconChecked,
                                      onFieldSubmitted: (value) {
                                        if(passController.text==password){
                                          Navigator.of(context).pop();
                                          showToast("Welcome Admin ");
                                          passController.text="";

                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return LayoutBuilder(
                                                builder: (BuildContext context, BoxConstraints constraints) {
                                                  return AlertDialog(

                                                    title: Text('Add Item'),
                                                    content: Container(
                                                      width: width*.5,
                                                      height: height*.47,
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.all(5.0),
                                                                child: Container(
                                                                  width: width*.24,
                                                                  height: height*.07,

                                                                  child: TextFormField(
                                                                    controller: itemNameController,

                                                                    decoration: InputDecoration(labelText: 'Item Name',
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
                                                                  height: height*.07,
                                                                  width: width*.13,
                                                                  child: TextFormField(

                                                                    controller: itemCategoryController,
                                                                    decoration: InputDecoration(labelText: 'Item Category',
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
                                                                  height: height*.07,
                                                                  width: width*.1,
                                                                  child: TextFormField(

                                                                    controller: itemCodeController,
                                                                    decoration: InputDecoration(labelText: 'Code',
                                                                      border:OutlineInputBorder(

                                                                        borderRadius: BorderRadius.circular(5),
                                                                        borderSide: BorderSide(
                                                                            color: Colors.green
                                                                        ),
                                                                      ),),
                                                                  ),
                                                                ),
                                                              ),

                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.all(5.0),
                                                                child: Container(
                                                                    height: height*.07,
                                                                    width: width*.115,
                                                                  child: TextFormField(
                                                                    controller: weightController,
                                                                    decoration: InputDecoration(labelText: 'Weight',
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
                                                                  height: height*.07,
                                                                  width: width*.115,
                                                                  child: TextFormField(
                                                                    controller: weightUnitController,
                                                                    decoration: InputDecoration(labelText: 'Weight Unit',
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
                                                                  height: height*.07,
                                                                  width: width*.115,
                                                                  child: TextFormField(
                                                                    controller: priceController,
                                                                    decoration: InputDecoration(labelText: 'Price',
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
                                                                  height: height*.07,
                                                                  width: width*.115,
                                                                  child: TextFormField(
                                                                    controller: discountPriceController,
                                                                    decoration: InputDecoration(labelText: 'Discount Price',
                                                                      border:OutlineInputBorder(

                                                                        borderRadius: BorderRadius.circular(5),
                                                                        borderSide: BorderSide(
                                                                            color: Colors.green
                                                                        ),
                                                                      ),),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [

                                                              Padding(
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: Container(
                                                                    height: height*.07,
                                                                    width: width*.27,
                                                                    child: TextFormField(
                                                                      controller: boughtPriceCodeController,
                                                                      decoration: InputDecoration(labelText: 'Bought Price',
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
                                                                    height: height*.07,
                                                                    width: width*.2,
                                                                    child: TextFormField(
                                                                      controller: quantityController,
                                                                      decoration: InputDecoration(labelText: 'Quantity',
                                                                        border:OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(5),
                                                                          borderSide: BorderSide(
                                                                              color: Colors.green
                                                                          ),
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),

                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.all(5.0),
                                                            child: TextFormField(
                                                              controller: notesController,

                                                              decoration: InputDecoration(labelText: 'Notes',
                                                                border:OutlineInputBorder(

                                                                  borderRadius: BorderRadius.circular(5),
                                                                  borderSide: BorderSide(
                                                                      color: Colors.green
                                                                  ),
                                                                ),),
                                                              maxLines: 5,
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
                                                        onPressed: () {
                                                          // Cancel button onPressed action
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text('Cancel'),
                                                      ),
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                                          // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                                        ),
                                                        onPressed: () async {
                                                          // Add button onPressed action
                                                          String itemName = itemNameController.text;
                                                          String itemCategory = itemCategoryController.text;
                                                          String weight = weightController.text;
                                                          String weightUnit = weightUnitController.text;
                                                          String price = priceController.text;
                                                          String discountPrice = discountPriceController.text;
                                                          String quantity = quantityController.text;
                                                          String notes = notesController.text;
                                                          String code = itemCodeController.text;

                                                          String boughtPrice = boughtPriceCodeController.text;

                                                          GetDataModel model=GetDataModel(code, notes, weight, weightUnit, itemCategory, price, discountPrice, itemName, quantity,boughtPrice);                                                          await  Firestore.instance.collection('data').document(code.toString()).set(model.toMap());
                                                          cubit.allData.add(model);
                                                          // Perform any action with the entered data (e.g., add to a list, save to database, etc.)

                                                          Navigator.of(context).pop();
                                                        },

                                                        child: Text('Add'),
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
                                            },
                                          );
                                        }
                                        else if(passController.text=='') {
                                          showToast("Password must not be empty ");

                                        }
                                        else{
                                          showToast("Wrong Password .... Please try again  ");


                                        }
                                      },


                                      decoration: InputDecoration(labelText: 'Password',
                                        prefixIcon:Icon(Icons.lock_outline_rounded),

                                        suffixIcon: IconButton(
                                          onPressed: (){
                                            // print(object)
                                            cubit.ChangePasswordVisability();
                                          },
                                          icon: Icon(
                                            cubit.isPasswordIconChecked ? Icons.remove_red_eye:Icons.visibility_off_sharp,
                                          ),
                                        ),

                                        border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.green
                                          ),
                                        ),),
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
                              onPressed: () {
                                // Cancel button onPressed action
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                  // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                ),
                                onPressed: () async {
                                  if(passController.text==password){
                                    Navigator.of(context).pop();

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return LayoutBuilder(
                                            builder: (BuildContext context, BoxConstraints constraints) {
                                              return AlertDialog(

                                                title: Text('Add Item'),
                                                content: Container(
                                                  width: width*.5,
                                                  height: height*.47,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.all(5.0),
                                                            child: Container(
                                                              width: width*.24,
                                                              height: height*.07,

                                                              child: TextFormField(
                                                                controller: itemNameController,

                                                                decoration: InputDecoration(labelText: 'Item Name',
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
                                                              height: height*.07,
                                                              width: width*.13,
                                                              child: TextFormField(

                                                                controller: itemCategoryController,
                                                                decoration: InputDecoration(labelText: 'Item Category',
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
                                                              height: height*.07,
                                                              width: width*.1,
                                                              child: TextFormField(

                                                                controller: itemCodeController,
                                                                decoration: InputDecoration(labelText: 'Code',
                                                                  border:OutlineInputBorder(

                                                                    borderRadius: BorderRadius.circular(5),
                                                                    borderSide: BorderSide(
                                                                        color: Colors.green
                                                                    ),
                                                                  ),),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.all(5.0),
                                                            child: Container(
                                                              height: height*.07,
                                                              width: width*.115,
                                                              child: TextFormField(
                                                                controller: weightController,
                                                                decoration: InputDecoration(labelText: 'Weight',
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
                                                              height: height*.07,
                                                              width: width*.115,
                                                              child: TextFormField(
                                                                controller: weightUnitController,
                                                                decoration: InputDecoration(labelText: 'Weight Unit',
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
                                                              height: height*.07,
                                                              width: width*.115,
                                                              child: TextFormField(
                                                                controller: priceController,
                                                                decoration: InputDecoration(labelText: 'Price',
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
                                                              height: height*.07,
                                                              width: width*.115,
                                                              child: TextFormField(
                                                                controller: discountPriceController,
                                                                decoration: InputDecoration(labelText: 'Discount Price',
                                                                  border:OutlineInputBorder(

                                                                    borderRadius: BorderRadius.circular(5),
                                                                    borderSide: BorderSide(
                                                                        color: Colors.green
                                                                    ),
                                                                  ),),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [

                                                          Padding(
                                                            padding: const EdgeInsets.all(5.0),
                                                            child: Container(
                                                              height: height*.07,
                                                              width: width*.27,
                                                              child: TextFormField(
                                                                controller: boughtPriceCodeController,
                                                                decoration: InputDecoration(labelText: 'Bought Price',
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
                                                              height: height*.07,
                                                              width: width*.2,
                                                              child: TextFormField(
                                                                controller: quantityController,
                                                                decoration: InputDecoration(labelText: 'Quantity',
                                                                  border:OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(5),
                                                                    borderSide: BorderSide(
                                                                        color: Colors.green
                                                                    ),
                                                                  ),),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: TextFormField(
                                                          controller: notesController,

                                                          decoration: InputDecoration(labelText: 'Notes',
                                                            border:OutlineInputBorder(

                                                              borderRadius: BorderRadius.circular(5),
                                                              borderSide: BorderSide(
                                                                  color: Colors.green
                                                              ),
                                                            ),),
                                                          maxLines: 5,
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
                                                    onPressed: () {
                                                      // Cancel button onPressed action
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: Text('Cancel'),
                                                  ),
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                                      // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                                    ),
                                                    onPressed: () async {
                                                      // Add button onPressed action
                                                      String itemName = itemNameController.text;
                                                      String itemCategory = itemCategoryController.text;
                                                      String weight = weightController.text;
                                                      String weightUnit = weightUnitController.text;
                                                      String price = priceController.text;
                                                      String discountPrice = discountPriceController.text;
                                                      String quantity = quantityController.text;
                                                      String notes = notesController.text;
                                                      String code = itemCodeController.text;

                                                      String boughtPrice = boughtPriceCodeController.text;

                                                      GetDataModel model=GetDataModel(code, notes, weight, weightUnit, itemCategory, price, discountPrice, itemName, quantity,boughtPrice);                                                      await  Firestore.instance.collection('data').document(code.toString()).set(model.toMap());
                                                      cubit.allData.add(model);
                                                      // Perform any action with the entered data (e.g., add to a list, save to database, etc.)

                                                      Navigator.of(context).pop();
                                                    },

                                                    child: Text('Add'),
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
                                        },
                                  );
                                  }
                                  else if(passController.text=='') {
                                    showToast("Password must not be empty ");

                                  }
                                  else{
                                    showToast("Wrong Password .... Please try again  ");


                                  }
                                },

                                child: const Text('Continue '),
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
                  },

                );




              },
              minWidth: double.infinity,
              child: Row(children: [
                Icon(Icons.add_circle,color: Colors.white,size: width*0.014,),
                SizedBox(width: 20,),
                Text("Add Product",style: TextStyle(color: Colors.white,fontSize: width*0.01),)
              ],
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              height: height*0.06,
              onPressed: () {
                AppCubit.get(context).isPasswordIconChecked=true;

              passController.text="";

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return AlertDialog(

                          title: Text('Enter Password'),
                          content: Container(
                            width: width*.2,
                            height: height*.09,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: height*.07,

                                    child: TextFormField(
                                      controller: passController,
                                      obscureText: cubit.isPasswordIconChecked,
                                      onFieldSubmitted: (value) {

                                        if(passController.text==password){
                                          Navigator.of(context).pop();
                                          showToast("Welcome Admin ");
                                          passController.text="";

                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return LayoutBuilder(
                                                builder: (BuildContext context, BoxConstraints constraints) {
                                                  return AlertDialog(

                                                    title: Text('Edit Item'),
                                                    content: Container(
                                                      width: width*.5,
                                                      height: height*.47,
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.all(5.0),
                                                                child: Container(
                                                                  width: width*.24,
                                                                  height: height*.07,

                                                                  child: TextFormField(
                                                                    controller: itemNameController,

                                                                    decoration: InputDecoration(labelText: 'Item Name',
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
                                                                  height: height*.07,
                                                                  width: width*.13,
                                                                  child: TextFormField(

                                                                    controller: itemCategoryController,
                                                                    decoration: InputDecoration(labelText: 'Item Category',
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
                                                                  height: height*.07,
                                                                  width: width*.1,
                                                                  child: TextFormField(

                                                                    controller: itemCodeController,
                                                                    decoration: InputDecoration(labelText: 'Code',
                                                                      border:OutlineInputBorder(

                                                                        borderRadius: BorderRadius.circular(5),
                                                                        borderSide: BorderSide(
                                                                            color: Colors.green
                                                                        ),
                                                                      ),),
                                                                  ),
                                                                ),
                                                              ),

                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.all(5.0),
                                                                child: Container(
                                                                  height: height*.07,
                                                                  width: width*.115,
                                                                  child: TextFormField(
                                                                    controller: weightController,
                                                                    decoration: InputDecoration(labelText: 'Weight',
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
                                                                  height: height*.07,
                                                                  width: width*.115,
                                                                  child: TextFormField(
                                                                    controller: weightUnitController,
                                                                    decoration: InputDecoration(labelText: 'Weight Unit',
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
                                                                  height: height*.07,
                                                                  width: width*.115,
                                                                  child: TextFormField(
                                                                    controller: priceController,
                                                                    decoration: InputDecoration(labelText: 'Price',
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
                                                                  height: height*.07,
                                                                  width: width*.115,
                                                                  child: TextFormField(
                                                                    controller: discountPriceController,
                                                                    decoration: InputDecoration(labelText: 'Discount Price',
                                                                      border:OutlineInputBorder(

                                                                        borderRadius: BorderRadius.circular(5),
                                                                        borderSide: BorderSide(
                                                                            color: Colors.green
                                                                        ),
                                                                      ),),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [

                                                              Padding(
                                                                padding: const EdgeInsets.all(5.0),
                                                                child: Container(
                                                                  height: height*.07,
                                                                  width: width*.27,
                                                                  child: TextFormField(
                                                                    controller: boughtPriceCodeController,
                                                                    decoration: InputDecoration(labelText: 'Bought Price',
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
                                                                  height: height*.07,
                                                                  width: width*.2,
                                                                  child: TextFormField(
                                                                    controller: quantityController,
                                                                    decoration: InputDecoration(labelText: 'Quantity',
                                                                      border:OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(5),
                                                                        borderSide: BorderSide(
                                                                            color: Colors.green
                                                                        ),
                                                                      ),),
                                                                  ),
                                                                ),
                                                              ),

                                                            ],
                                                          ),

                                                          Padding(
                                                            padding: const EdgeInsets.all(5.0),
                                                            child: TextFormField(
                                                              controller: notesController,

                                                              decoration: InputDecoration(labelText: 'Notes',
                                                                border:OutlineInputBorder(

                                                                  borderRadius: BorderRadius.circular(5),
                                                                  borderSide: BorderSide(
                                                                      color: Colors.green
                                                                  ),
                                                                ),
                                                              ),
                                                              maxLines: 5,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text('Cancel'),
                                                      ),
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                                        ),

                                                        onPressed: () async {
                                                          String itemName = itemNameController.text;
                                                          String itemCategory = itemCategoryController.text;
                                                          String weight = weightController.text;
                                                          String weightUnit = weightUnitController.text;
                                                          String price = priceController.text;
                                                          String discountPrice = discountPriceController.text;
                                                          String quantity = quantityController.text;
                                                          String notes = notesController.text;
                                                          String code = itemCodeController.text;
                                                          String boughtPrice = boughtPriceCodeController.text;

                                                          GetDataModel model=GetDataModel(code, notes, weight, weightUnit, itemCategory, price, discountPrice, itemName, quantity,boughtPrice);
                                                          await  Firestore.instance.collection('data').document(code.toString()).update(model.toMap());
                                                          cubit.getItemToUpdate(model);

                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text('Edit'),
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
                                            },
                                          );
                                        }
                                        else if(passController.text=='') {
                                          showToast("Password must not be empty ");

                                        }
                                        else{
                                          showToast("Wrong Password .... Please try again  ");


                                        }
                                      },


                                      decoration: InputDecoration(labelText: 'Password',
                                        prefixIcon:Icon(Icons.lock_outline_rounded),

                                        suffixIcon: IconButton(
                                          onPressed: (){
                                            // print(object)
                                            cubit.ChangePasswordVisability();
                                          },
                                          icon: Icon(
                                            cubit.isPasswordIconChecked ? Icons.remove_red_eye:Icons.visibility_off_sharp,
                                          ),
                                        ),

                                        border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.green
                                          ),
                                        ),),
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
                              onPressed: () {
                                // Cancel button onPressed action
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                  // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                ),
                                onPressed: () async {
                                  if(passController.text==password){
                                    Navigator.of(context).pop();

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return LayoutBuilder(
                                          builder: (BuildContext context, BoxConstraints constraints) {
                                            return AlertDialog(

                                              title: Text('Edit Item'),
                                              content: Container(
                                                width: width*.5,
                                                height: height*.47,
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Container(
                                                            width: width*.24,
                                                            height: height*.07,

                                                            child: TextFormField(
                                                              controller: itemNameController,

                                                              decoration: InputDecoration(labelText: 'Item Name',
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
                                                            height: height*.07,
                                                            width: width*.13,
                                                            child: TextFormField(

                                                              controller: itemCategoryController,
                                                              decoration: InputDecoration(labelText: 'Item Category',
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
                                                            height: height*.07,
                                                            width: width*.1,
                                                            child: TextFormField(

                                                              controller: itemCodeController,
                                                              decoration: InputDecoration(labelText: 'Code',
                                                                border:OutlineInputBorder(

                                                                  borderRadius: BorderRadius.circular(5),
                                                                  borderSide: BorderSide(
                                                                      color: Colors.green
                                                                  ),
                                                                ),),
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Container(
                                                            height: height*.07,
                                                            width: width*.115,
                                                            child: TextFormField(
                                                              controller: weightController,
                                                              decoration: InputDecoration(labelText: 'Weight',
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
                                                            height: height*.07,
                                                            width: width*.115,
                                                            child: TextFormField(
                                                              controller: weightUnitController,
                                                              decoration: InputDecoration(labelText: 'Weight Unit',
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
                                                            height: height*.07,
                                                            width: width*.115,
                                                            child: TextFormField(
                                                              controller: priceController,
                                                              decoration: InputDecoration(labelText: 'Price',
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
                                                            height: height*.07,
                                                            width: width*.115,
                                                            child: TextFormField(
                                                              controller: discountPriceController,
                                                              decoration: InputDecoration(labelText: 'Discount Price',
                                                                border:OutlineInputBorder(

                                                                  borderRadius: BorderRadius.circular(5),
                                                                  borderSide: BorderSide(
                                                                      color: Colors.green
                                                                  ),
                                                                ),),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [

                                                        Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Container(
                                                            height: height*.07,
                                                            width: width*.27,
                                                            child: TextFormField(
                                                              controller: boughtPriceCodeController,
                                                              decoration: InputDecoration(labelText: 'Bought Price',
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
                                                            height: height*.07,
                                                            width: width*.2,
                                                            child: TextFormField(
                                                              controller: quantityController,
                                                              decoration: InputDecoration(labelText: 'Quantity',
                                                                border:OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                  borderSide: BorderSide(
                                                                      color: Colors.green
                                                                  ),
                                                                ),),
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: TextFormField(
                                                        controller: notesController,

                                                        decoration: InputDecoration(labelText: 'Notes',
                                                          border:OutlineInputBorder(

                                                            borderRadius: BorderRadius.circular(5),
                                                            borderSide: BorderSide(
                                                                color: Colors.green
                                                            ),
                                                          ),
                                                        ),
                                                        maxLines: 5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Cancel'),
                                                ),
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                                  ),

                                                  onPressed: () async {
                                                    String itemName = itemNameController.text;
                                                    String itemCategory = itemCategoryController.text;
                                                    String weight = weightController.text;
                                                    String weightUnit = weightUnitController.text;
                                                    String price = priceController.text;
                                                    String discountPrice = discountPriceController.text;
                                                    String quantity = quantityController.text;
                                                    String notes = notesController.text;
                                                    String code = itemCodeController.text;
                                                    String boughtPrice = boughtPriceCodeController.text;

                                                    GetDataModel model=GetDataModel(code, notes, weight, weightUnit, itemCategory, price, discountPrice, itemName, quantity,boughtPrice);
                                                    await  Firestore.instance.collection('data').document(code.toString()).update(model.toMap());
                                                    cubit.getItemToUpdate(model);

                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Edit'),
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
                                      },
                                    );
                                  }
                                  else if(passController.text=='') {
                                    showToast("Password must not be empty ");

                                  }
                                  else{
                                    showToast("Wrong Password .... Please try again  ");


                                  }
                                },

                                child: const Text('Continue '),
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
                  },

                );




              },

              minWidth: double.infinity,
              child: Row(children: [
                Icon(Icons.edit,color: Colors.white,size: width*0.014,),
                SizedBox(width: 20,),
                Text("Edit Product",style: TextStyle(color: Colors.white,fontSize: width*0.01),)
              ],
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(

              height: height*0.06,

              onPressed: () {
                passController.text="";
                AppCubit.get(context).isPasswordIconChecked=true;

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return AlertDialog(

                          title: Text('Enter Password'),
                          content: Container(
                            width: width*.2,
                            height: height*.09,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: height*.07,

                                    child: TextFormField(
                                      controller: passController,
                                      obscureText: cubit.isPasswordIconChecked,
                                      onFieldSubmitted: (value) {

                                        if(passController.text==password){

                                          AppCubit.get(context).searchData=[];
                                          Navigator.of(context).pop();
                                          showToast("Welcome Admin ");
                                          passController.text="";




                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
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
                                                      SizedBox(height: 20),
                                                      DefaultTFF(Controller: c1,
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
                                                      Expanded(
                                                          child: ListView.separated(
                                                            padding: const EdgeInsets.all(1),
                                                            itemCount:cubit.searchData.length,
                                                            itemBuilder: (BuildContext context, int index) =>
                                                                removeList(height,width,context,cubit.searchData[index]),
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
                                        else if(passController.text=='') {
                                          showToast("Password must not be empty ");

                                        }
                                        else{
                                          showToast("Wrong Password .... Please try again  ");


                                        }
                                      },


                                      decoration: InputDecoration(labelText: 'Password',
                                        prefixIcon:Icon(Icons.lock_outline_rounded),

                                        suffixIcon: IconButton(
                                          onPressed: (){
                                            // print(object)
                                            cubit.ChangePasswordVisability();
                                          },
                                          icon: Icon(
                                            cubit.isPasswordIconChecked ? Icons.remove_red_eye:Icons.visibility_off_sharp,
                                          ),
                                        ),

                                        border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.green
                                          ),
                                        ),),
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
                              onPressed: () {
                                // Cancel button onPressed action
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                  // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                ),
                                onPressed: () async {
                                  if(passController.text==password){
                                    Navigator.of(context).pop();

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
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
                                                SizedBox(height: 20),
                                                DefaultTFF(Controller: c1,
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
                                                Expanded(
                                                    child: ListView.separated(
                                                      padding: const EdgeInsets.all(1),
                                                      itemCount:cubit.searchData.length,
                                                      itemBuilder: (BuildContext context, int index) =>
                                                          removeList(height,width,context,cubit.searchData[index]),
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
                                  else if(passController.text=='') {
                                    showToast("Password must not be empty ");

                                  }
                                  else{
                                    showToast("Wrong Password .... Please try again  ");


                                  }
                                },

                                child: const Text('Continue '),
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
                  },

                );




              },

              minWidth: double.infinity,
              child: Row(children: [
                Icon(Icons.remove,color: Colors.white,size: width*0.014,),
                SizedBox(width: 20,),
                Text("Remove Product",style: TextStyle(color: Colors.white,fontSize: width*0.01),)
              ],
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(

              height: height*0.06,
              onPressed: () {
                cubit.getMoneySholudPay();


                cubit.notification=false;
                cubit.changeState();
                   showDialog(
                  context: context,
                  builder: (BuildContext context) {
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
                            SizedBox(height: 20),
                            Text("Money should pay",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                            SizedBox(height: 10),
                            Expanded(
                                child:    cubit.moneyShouldPay.length!= 0 ?
                                ListView.separated(
                                  padding: const EdgeInsets.all(1),
                                  itemCount:cubit.moneyShouldPay.length,
                                  itemBuilder: (BuildContext context, int index) =>
                                      deptList(height,width,context,cubit.moneyShouldPay[index]),
                                  separatorBuilder: (BuildContext context, int index) =>
                                      Container(),
                                )
                                    :
                                Center(child: Text("NONE..",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))

                              ),

                            SizedBox(height: 10),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed


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
              },

              minWidth: double.infinity,
              child: Row(children: [
                Stack(
                  alignment: AlignmentDirectional.centerStart,

                  children: [
                    Icon(Icons.monetization_on_outlined,color: AppColors.mainYellow,),
                    cubit.notification ?
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.red,),

                        height: height*.015,
                        width:  height*.015,
                      ),
                    ) : Container(),
                    // SizedBox(width: 20,),
                    // Text("Customer Debt",style: TextStyle(color: Colors.white,fontSize: width*0.01),)
                  ],
                ),
                SizedBox(width: 20,),
                Text("Customer Debt",style: TextStyle(color: Colors.white,fontSize: width*0.01),)
              ],
              ),
            ),



            Spacer(),
            MaterialButton(
              height: height*0.06,
              onPressed: () {
                navigatorAndFinish(context, LoginScreen());
                userData=null;
              },
              minWidth: double.infinity,
              child: Row(children: [
                Icon(Icons.logout_outlined,color: Colors.white,size: width*0.014,),
                SizedBox(width: 20,),
                Text("Logout",style: TextStyle(color: Colors.white,fontSize: width*0.01),)
              ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget sss(height,width,context)=>            MaterialButton(
    height: height*0.06,
    onPressed: () {
      AppCubit.get(context).isPasswordIconChecked=true;

      passController.text="";
      showDialog(
        context: context,
        builder: (BuildContext context) {
          AppCubit cubit=AppCubit.get(context);
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return AlertDialog(

                title: Text('Enter Password'),
                content: Container(
                  width: width*.2,
                  height: height*.09,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: height*.07,

                          child: TextFormField(
                            controller: passController,
                            obscureText: cubit.isPasswordIconChecked,
                            onFieldSubmitted: (value) {
                              if(passController.text==password){
                                Navigator.of(context).pop();
                                showToast("Welcome Admin ");
                                passController.text="";
                                print("ssssssssssssssss");

                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) {
                                //     return LayoutBuilder(
                                //       builder: (BuildContext context, BoxConstraints constraints) {
                                //         return AlertDialog(
                                //
                                //           title: Text('Add sssss'),
                                //           content: Container(
                                //             color: Colors.green,
                                //             width: width*.25,
                                //             height: height*.47,
                                //             child: Column(
                                //               mainAxisSize: MainAxisSize.min,
                                //               children: [
                                //                 Padding(
                                //                   padding: const EdgeInsets.all(5.0),
                                //                   child: Container(
                                //                     width: width*.24,
                                //                     height: height*.07,
                                //
                                //                     child: TextFormField(
                                //                       controller: itemNameController,
                                //
                                //                       decoration: InputDecoration(labelText: 'Item Name',
                                //                         border:OutlineInputBorder(
                                //
                                //                           borderRadius: BorderRadius.circular(5),
                                //                           borderSide: BorderSide(
                                //                               color: Colors.green
                                //                           ),
                                //                         ),),
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 Padding(
                                //                   padding: const EdgeInsets.all(5.0),
                                //                   child: Container(
                                //                     width: width*.24,
                                //                     height: height*.07,
                                //
                                //                     child: TextFormField(
                                //                       controller: itemNameController,
                                //
                                //                       decoration: InputDecoration(labelText: 'Item Name',
                                //                         border:OutlineInputBorder(
                                //
                                //                           borderRadius: BorderRadius.circular(5),
                                //                           borderSide: BorderSide(
                                //                               color: Colors.green
                                //                           ),
                                //                         ),),
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 Padding(
                                //                   padding: const EdgeInsets.all(5.0),
                                //                   child: Container(
                                //                     width: width*.24,
                                //                     height: height*.07,
                                //
                                //                     child: TextFormField(
                                //                       controller: itemNameController,
                                //
                                //                       decoration: InputDecoration(labelText: 'Item Name',
                                //                         border:OutlineInputBorder(
                                //
                                //                           borderRadius: BorderRadius.circular(5),
                                //                           borderSide: BorderSide(
                                //                               color: Colors.green
                                //                           ),
                                //                         ),),
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 Padding(
                                //                   padding: const EdgeInsets.all(5.0),
                                //                   child: Container(
                                //                     width: width*.24,
                                //                     height: height*.07,
                                //
                                //                     child: TextFormField(
                                //                       controller: itemNameController,
                                //
                                //                       decoration: InputDecoration(labelText: 'Item Name',
                                //                         border:OutlineInputBorder(
                                //
                                //                           borderRadius: BorderRadius.circular(5),
                                //                           borderSide: BorderSide(
                                //                               color: Colors.green
                                //                           ),
                                //                         ),),
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 Padding(
                                //                   padding: const EdgeInsets.all(5.0),
                                //                   child: Container(
                                //                     width: width*.24,
                                //                     height: height*.07,
                                //
                                //                     child: TextFormField(
                                //                       controller: itemNameController,
                                //
                                //                       decoration: InputDecoration(labelText: 'Item Name',
                                //                         border:OutlineInputBorder(
                                //
                                //                           borderRadius: BorderRadius.circular(5),
                                //                           borderSide: BorderSide(
                                //                               color: Colors.green
                                //                           ),
                                //                         ),),
                                //                     ),
                                //                   ),
                                //                 ),
                                //
                                //               ],
                                //             ),
                                //           ),
                                //           actions: <Widget>[
                                //             ElevatedButton(
                                //               style: ButtonStyle(
                                //                 backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                //                 // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                //               ),
                                //               onPressed: () {
                                //                 // Cancel button onPressed action
                                //                 Navigator.of(context).pop();
                                //               },
                                //               child: Text('Cancel'),
                                //             ),
                                //             ElevatedButton(
                                //               style: ButtonStyle(
                                //                 backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                //                 // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                //               ),
                                //               onPressed: () async {
                                //                 // Add button onPressed action
                                //
                                //                 // Perform any action with the entered data (e.g., add to a list, save to database, etc.)
                                //
                                //                 Navigator.of(context).pop();
                                //               },
                                //
                                //               child: Text('Add'),
                                //             ),
                                //           ],
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.all(
                                //               Radius.circular(16.0),
                                //             ),
                                //           ),
                                //         );
                                //       },
                                //     );
                                //   },
                                // );
                              }
                              else if(passController.text=='') {
                                showToast("Password must not be empty ");

                              }
                              else{
                                showToast("Wrong Password .... Please try again  ");


                              }
                            },


                            decoration: InputDecoration(labelText: 'Password',
                              prefixIcon:Icon(Icons.lock_outline_rounded),

                              suffixIcon: IconButton(
                                onPressed: (){
                                  // print(object)
                                  cubit.ChangePasswordVisability();
                                },
                                icon: Icon(
                                  cubit.isPasswordIconChecked ? Icons.remove_red_eye:Icons.visibility_off_sharp,
                                ),
                              ),

                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Colors.green
                                ),
                              ),),
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
                    onPressed: () {
                      // Cancel button onPressed action
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                        // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                      ),
                      onPressed: () async {
                        if(passController.text==password){
                          Navigator.of(context).pop();

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return LayoutBuilder(
                                builder: (BuildContext context, BoxConstraints constraints) {
                                  return AlertDialog(

                                    title: Text('Add Item'),
                                    content: Container(
                                      width: width*.5,
                                      height: height*.47,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Container(
                                                  width: width*.24,
                                                  height: height*.07,

                                                  child: TextFormField(
                                                    controller: itemNameController,

                                                    decoration: InputDecoration(labelText: 'Item Name',
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
                                                  height: height*.07,
                                                  width: width*.13,
                                                  child: TextFormField(

                                                    controller: itemCategoryController,
                                                    decoration: InputDecoration(labelText: 'Item Category',
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
                                                  height: height*.07,
                                                  width: width*.1,
                                                  child: TextFormField(

                                                    controller: itemCodeController,
                                                    decoration: InputDecoration(labelText: 'Code',
                                                      border:OutlineInputBorder(

                                                        borderRadius: BorderRadius.circular(5),
                                                        borderSide: BorderSide(
                                                            color: Colors.green
                                                        ),
                                                      ),),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Container(
                                                  height: height*.07,
                                                  width: width*.115,
                                                  child: TextFormField(
                                                    controller: weightController,
                                                    decoration: InputDecoration(labelText: 'Weight',
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
                                                  height: height*.07,
                                                  width: width*.115,
                                                  child: TextFormField(
                                                    controller: weightUnitController,
                                                    decoration: InputDecoration(labelText: 'Weight Unit',
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
                                                  height: height*.07,
                                                  width: width*.115,
                                                  child: TextFormField(
                                                    controller: priceController,
                                                    decoration: InputDecoration(labelText: 'Price',
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
                                                  height: height*.07,
                                                  width: width*.115,
                                                  child: TextFormField(
                                                    controller: discountPriceController,
                                                    decoration: InputDecoration(labelText: 'Discount Price',
                                                      border:OutlineInputBorder(

                                                        borderRadius: BorderRadius.circular(5),
                                                        borderSide: BorderSide(
                                                            color: Colors.green
                                                        ),
                                                      ),),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [

                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Container(
                                                  height: height*.07,
                                                  width: width*.27,
                                                  child: TextFormField(
                                                    controller: boughtPriceCodeController,
                                                    decoration: InputDecoration(labelText: 'Bought Price',
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
                                                  height: height*.07,
                                                  width: width*.2,
                                                  child: TextFormField(
                                                    controller: quantityController,
                                                    decoration: InputDecoration(labelText: 'Quantity',
                                                      border:OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(5),
                                                        borderSide: BorderSide(
                                                            color: Colors.green
                                                        ),
                                                      ),),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: TextFormField(
                                              controller: notesController,

                                              decoration: InputDecoration(labelText: 'Notes',
                                                border:OutlineInputBorder(

                                                  borderRadius: BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                      color: Colors.green
                                                  ),
                                                ),),
                                              maxLines: 5,
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
                                        onPressed: () {
                                          // Cancel button onPressed action
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                                          // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                                        ),
                                        onPressed: () async {
                                          // Add button onPressed action
                                          String itemName = itemNameController.text;
                                          String itemCategory = itemCategoryController.text;
                                          String weight = weightController.text;
                                          String weightUnit = weightUnitController.text;
                                          String price = priceController.text;
                                          String discountPrice = discountPriceController.text;
                                          String quantity = quantityController.text;
                                          String notes = notesController.text;
                                          String code = itemCodeController.text;

                                          String boughtPrice = boughtPriceCodeController.text;

                                          GetDataModel model=GetDataModel(code, notes, weight, weightUnit, itemCategory, price, discountPrice, itemName, quantity,boughtPrice);                                                      await  Firestore.instance.collection('data').document(code.toString()).set(model.toMap());
                                          cubit.allData.add(model);
                                          // Perform any action with the entered data (e.g., add to a list, save to database, etc.)

                                          Navigator.of(context).pop();
                                        },

                                        child: Text('Add'),
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
                            },
                          );
                        }
                        else if(passController.text=='') {
                          showToast("Password must not be empty ");

                        }
                        else{
                          showToast("Wrong Password .... Please try again  ");


                        }
                      },

                      child: const Text('Continue '),
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
        },

      );




    },
    minWidth: double.infinity,
    child: Row(children: [
      Icon(Icons.add,color: Colors.white,size: width*0.014,),
      SizedBox(width: 20,),
      Text("Add User",style: TextStyle(color: Colors.white,fontSize: width*0.01),)
    ],
    ),
  );

}



Widget removeList(height,width,context,GetDataModel model ) => Padding(
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
            icon: const Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              Firestore.instance.collection("data").document(model.code).delete();
              AppCubit.get(context).allData.remove(model);
              AppCubit.get(context).searchData.remove(model);
              AppCubit.get(context).changeState();


            },
          ),
        ),
      ],
    ),
  ),
);

Widget deptList(height,width,context,SSS model ) => Padding(
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
            Icons.person,
            size:18,
          ),
        ),
        Row(
          children: [
            Text(
              "Name: " ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(fontSize: height*width*0.000011 ),
            ),
            Text(
              "${model.ClientName} " ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(fontWeight: FontWeight.bold,fontSize: height*width*0.000011 ),
            ),

          ],
        ),
         SizedBox(
          width: width*0.01,
        ),
        Row(
          children: [
            Text(
              "Phone: " ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(fontSize: height*width*0.000011 ),
            ),
            Text(
              "${model.ClientPhoneNumber} " ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(fontWeight: FontWeight.bold,fontSize: height*width*0.000011 ),
            ),

          ],
        ),
        SizedBox(
          width: width*0.01,
        ),
        Row(
          children: [
            Text(
              "Debt: " ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(fontSize: height*width*0.000011 ),
            ),
            Text(
              "${model.money} " ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(fontWeight: FontWeight.bold,fontSize: height*width*0.000011 ),
            ),

          ],
        ),
      Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Date: " ,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:  TextStyle(fontSize: height*width*0.000011 ),
              ),
              Text(
                "${model.date} " ,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:  TextStyle(fontWeight: FontWeight.bold,fontSize: height*width*0.000011 ),
              ),

            ],
          ),
        ),



      ],
    ),
  ),
);
