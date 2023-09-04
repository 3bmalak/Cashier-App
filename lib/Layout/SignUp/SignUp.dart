import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Modules/login/app_colors.dart';
import '../../Layout/cubit/cubit.dart';
import '../../Layout/cubit/states.dart';
import '../../Shared/Components/Component.dart';
import '../../models/ProductsModel.dart';
import '../../models/getDataNodel.dart';


class AddNewUserScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Get the screen size to make the dialog responsive
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();
    TextEditingController name=TextEditingController();
    TextEditingController phoneNumber=TextEditingController();



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

                SizedBox(height: 20),
                DefaultTFF(Controller: name,
                    context: context,
                    Validate: (value) {

                    },
                    // PrefixIcon:CupertinoIcons.search,
                    OnChange: (value) {
                      cubit.searchData=[];
                      cubit.getSearch(value);
                    },
                    Label: "Name"),
                SizedBox(height: 10),
                DefaultTFF(Controller: phoneNumber,
                    context: context,
                    Validate: (value) {

                    },
                    // PrefixIcon:CupertinoIcons.search,
                    OnChange: (value) {
                      cubit.searchData=[];
                      cubit.getSearch(value);
                    },
                    Label: "Phone Number"),
                SizedBox(height: 10),
                DefaultTFF(Controller: email,
                    context: context,
                    Validate: (value) {

                    },
                    // PrefixIcon:CupertinoIcons.search,
                    OnChange: (value) {
                      cubit.searchData=[];
                      cubit.getSearch(value);
                    },
                    Label: "Email"),
                SizedBox(height: 10),
                DefaultTFF(Controller:password,
                    context: context,
                    Validate: (value) {

                    },
                    // PrefixIcon:CupertinoIcons.search,
                    OnChange: (value) {
                      cubit.searchData=[];
                      cubit.getSearch(value);
                    },
                    Label: "Password"),
                SizedBox(height: 10),
                // Replace this ListView with your actual search results ListView
                // For demonstration purposes, I'm just showing an empty ListView.

                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        // backgroundColor:  MaterialStateProperty<AppColors.mainBlueColor>
                      ),

                      onPressed: () {
                        AppCubit.get(context).signUp(email.text, password.text, name.text, phoneNumber.text);
                        // Navigator.of(context).pop();
                      },
                      child: Text("Add"),
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

