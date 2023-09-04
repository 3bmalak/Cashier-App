import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/Modules/login/responsive_widget.dart';
import '../../Layout/Cashier.dart';
import '../../Layout/cubit/cubit.dart';
import '../../Shared/Components/Component.dart';
import 'app_colors.dart';
import 'app_styles.dart';
import 'cubit/LoginCubit.dart';
import 'cubit/LoginStates.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);
  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();

  bool loading=false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context, state) {
        if (state is LoginLoadingState){
          loading=true;
        }
        else {
          loading=false;
        }

      },
      builder: (context, state) {
        LoginCubit cubit =LoginCubit.get(context);
        var formKey =GlobalKey<FormState>();


        return Scaffold(
          backgroundColor: AppColors.backColor,
          body: SizedBox(
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ResponsiveWidget.isSmallScreen(context) ?
                const SizedBox() :
                Expanded(
                  child: Container(
                    height: height,
                    color: AppColors.mainBlueColor,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Text(
                            'Eltranesy for animal feed',
                            style: ralewayStyle.copyWith(
                              fontSize: 48.0,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'powered by',
                                  style: ralewayStyle.copyWith(
                                    fontSize: 20.0,
                                    color: AppColors.mainYellow,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Image(image: AssetImage("assets/images/log12.png"),height: height*0.05,),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: height,
                    margin: EdgeInsets.symmetric(horizontal: ResponsiveWidget.isSmallScreen(context)? height * 0.032 : height * 0.12),
                    color: AppColors.backColor,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: height * 0.2),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Let’s',
                                      style: ralewayStyle.copyWith(
                                        fontSize: 25.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.normal,
                                      )),
                                  TextSpan(
                                    text: ' Sign In 👇',
                                    style: ralewayStyle.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black87,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text('Hey, Enter your details to get sign in \nto your account.',
                              style: ralewayStyle.copyWith(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor,
                              ),
                            ),
                            SizedBox(height: height * 0.064),

                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text('Email',
                                style: ralewayStyle.copyWith(
                                  fontSize: 12.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6.0),
                            Container(
                              height: 50.0,
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: AppColors.whiteColor,
                              ),
                              child: TextFormField(
                                controller: emailController,
                                validator:(value) {
                                  bool at=false;
                                  if(value!.isEmpty){
                                    return 'Email Address must not be empty';
                                  }
                                  return null;
                                } ,

                                style: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15.0,
                                ),

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon:Icon(Icons.email_outlined),
                                  contentPadding: const EdgeInsets.only(top: 16.0),
                                  hintText: 'Enter Email',
                                  hintStyle: ralewayStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87.withOpacity(0.5),
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: height * 0.014),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text('Password',
                                style: ralewayStyle.copyWith(
                                  fontSize: 12.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6.0),
                            Container(
                              height: 50.0,
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: AppColors.whiteColor,
                              ),
                              child: TextFormField(
                                controller: passwordController,

                                validator:  (value) {
                                  if(value!.isEmpty){
                                    return 'Password must not be empty';
                                  }
                                  return null;
                                },

                                style: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15.0,
                                ),
                                obscureText: cubit.isPasswordIconChecked,

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon:Icon(Icons.lock_outline_rounded),
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      cubit.ChangePasswordVisability();
                                    },
                                    icon: Icon(
                                      cubit.isPasswordIconChecked ? Icons.remove_red_eye:Icons.visibility_off_sharp,
                                    ),
                                  ),

                                  contentPadding: const EdgeInsets.only(top: 16.0),
                                  hintText: 'Enter Password',
                                  hintStyle: ralewayStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87.withOpacity(0.5),
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: height * 0.05),
                           loading?
                           Center(
                             child: CircularProgressIndicator(
                               valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainBlueColor),
                             ),
                           ):
                           Center(
                             child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: (){

                                    if(formKey.currentState!.validate())
                                    {
                                      cubit.signIn(emailController.text,passwordController.text,context);


                                    }

                                  },
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Ink(
                                    padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: AppColors.mainBlueColor,
                                    ),
                                    child: Text('Sign In',
                                      style: ralewayStyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.whiteColor,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                           ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ) ;
      },
    );
  }
}

