
import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Shared/Components/constants.dart';
import 'package:untitled1/models/UserDataModel.dart';
import '../../../Layout/Cashier.dart';
import '../../../Layout/cubit/cubit.dart';
import '../../../Shared/Components/Component.dart';
import '../../../Shared/Network/End_Points/end_points.dart';
import '../../../Shared/Network/local/cache_Helper.dart';
import '../app_colors.dart';
import 'LoginStates.dart';






class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(ShopLoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isCreated=false;

  void createIconEye(){
    isCreated=true;
    emit(isPasswordIconCreatedLoginState());

  }

  bool isPasswordIconChecked=true;

  void ChangePasswordVisability(){
    isPasswordIconChecked =! isPasswordIconChecked;
    emit(isPasswordIconCheckedLoginState());
  }


  void Changestate(){
    emit(ShopLoginInitState());
  }

  Future<void> signIn(String email, String password,context) async {
    emit(LoginLoadingState());

    await FirebaseAuth.instance.signIn(email, password).
    then(( value)   {

      RegExp regExp = RegExp(r'localId:\s*(\S+),');
      Match? match = regExp.firstMatch(value.toString());
      String UId ="";
      if (match != null) {
        UId = match.group(1)!;
        print(UId); // Output: 49DKffIvwGMUJLmqqokCUKNFayw2
      } else {
        print('localId not found');
      }


        Firestore.instance.collection("users").document(UId.toString()).get().then((value) {
        UserDataModel data=UserDataModel.fromJson(value);
        userData=data;
        print(data.name);
        emit(LoginSuccessState());
        showToast("Login Successfully");
        AppCubit.get(context).getFirebase();
        AppCubit.get(context).getHistory();
        // AppCubit.get(context).getMoneySholudPay();
        if( AppCubit.get(context).moneyShouldPay.length!=0) {
          AppCubit.get(context).notification=true;
        }


        navigatorAndFinish(context, CashierrApp());
        TextEditingController s=TextEditingController();


        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {

            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return AlertDialog(


                  title: const Text('Enter Money Amount'),
                  content: Container(
                    width: 300,
                    height: 80,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            // height: height*.07,
                            //
                            child: TextFormField(
                              controller: s,
                              onFieldSubmitted: (value) {



                              },


                              decoration: InputDecoration(labelText: 'Money',
                                prefixIcon:Icon(Icons.monetization_on),


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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainBlueColor), // Customize the button color if needed
                          // Other style properties like textStyle, elevation, shape, etc. can also be customized here.
                        ),
                        onPressed: () async {
                          if(s.text!=""){
                            AppCubit.get(context).moneyAmount=double.parse(s.text);
                            AppCubit.get(context).changeState();
                            Navigator.of(context).pop();

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
      });

      print(value);
    }).catchError((onError){
      showToast("Invalid email or password");
      print(onError.toString());
      emit(LoginErrortState());
    });
    print('User created with email $email');

  }


}