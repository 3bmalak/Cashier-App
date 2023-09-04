
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Modules/login/app_colors.dart';
import '../../Modules/login/app_styles.dart';
import '../Network/local/cache_Helper.dart';

Widget DefaultButton(
    {
      double width=double.infinity,
      Color Background=Colors.transparent,
      required String text,
      required VoidCallback function,
      var fontcolor=Colors.white,

    })=>
    Material(
      color: Background,
      child: InkWell(
        onTap: function,
        borderRadius: BorderRadius.circular(16.0),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 18.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: AppColors.mainBlueColor,
          ),
          child: Text(
            text,
            style: ralewayStyle.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );







Widget DefaultTFF(
    {

  required TextEditingController Controller,
   TextInputType? Keyboard,
  ValueChanged<String>? OnSubmit,
  ValueChanged<String>? OnChange,
  required FormFieldValidator<String> Validate,
   IconData? PrefixIcon,
  IconData? SufffixIcon ,
  required String Label,
  VoidCallback? SuffixFunction,
  bool IsPassword=false,
  GestureTapCallback? onTap,
  bool onChecked=true,
    required  context,

    })=>Container(
  height:MediaQuery.of(context).size.height*.07,
  // width: MediaQuery.of(context).size.width*.4,

  child:   TextFormField(

    cursorColor: Colors.black,
    controller: Controller ,
    keyboardType:Keyboard,
    onFieldSubmitted: OnSubmit,
    onChanged: OnChange,
    validator: Validate,
    obscureText: IsPassword,
    onTap: onTap,
    enabled: onChecked,
    decoration: InputDecoration(
      fillColor: Colors.black,
      contentPadding: EdgeInsets.zero, // Remove internal padding

      labelText: Label,
      prefixIcon: Icon(PrefixIcon,size: MediaQuery.of(context).size.height*.02,),
      suffixIcon:  IconButton(
        onPressed: SuffixFunction
        , icon: Icon(
        SufffixIcon,
        color: Colors.black,
        ),
      ),

      border:OutlineInputBorder(

      borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(

          color: Colors.green
        ),
      ),

    ),
  ),
);

Widget MyDivider()=>Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);

void navigatorTo(context,widget) => Navigator.push(
    context,
    MaterialPageRoute(builder:(context) =>  widget,)
);

void navigatorAndFinish(context,widget) => Navigator.pushAndRemoveUntil(
  context,
    MaterialPageRoute(builder:(context) =>  widget,),
      (route)=>false
);



void toast({
  required String message,
  required Color color,

}) => Fluttertoast.showToast(
msg: message,
toastLength: Toast.LENGTH_LONG,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 5,
backgroundColor:color,
textColor: Colors.white,
fontSize: 16.0,
);

// void SignOut( context)
// {
//   CacheHelper.SaveData(key: 'token', value: '').then((value) {
//     if(value){
//       navigatorAndFinish(context, ShopLoginScreen());
//       ShopAppCubit.get(context).CurrentIndix=0;
//       ShopAppCubit.get(context).changeScreen(indix: 0);
//     }
//   });
// }


double screenHight(context)
{
  return MediaQuery.of(context).size.height;
}
double screenWidth(context){

  return MediaQuery.of(context).size.width;
}

void showToast(String message) {
  BotToast.showCustomText(
      duration:Duration(seconds: 3),
      toastBuilder: (cancelFunc) {
      return Container(
        // height: 50,

        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.black54.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          message,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      );
    },
  );
}
