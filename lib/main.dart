import 'package:bot_toast/bot_toast.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsheets/gsheets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/googleSheet.dart';
import 'Layout/SignUp/SignUp.dart';
import 'Layout/cubit/cubit.dart';
import 'Layout/cubit/states.dart';
import 'Modules/login/app_colors.dart';
import 'Modules/login/cubit/LoginCubit.dart';
import 'Modules/login/login_screen.dart';
import 'Shared/block_observer.dart';
import 'models/getDataNodel.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

const dynamic apiKey = 'AIzaSyAg06VfMyk2lulikEtVtQ8XOV7ycoVoHo8';
const dynamic projectId = 'cashierapp-c9467';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore.initialize(projectId);
  Bloc.observer = MyBlocObserver();
  // BotToastInit();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  FirebaseAuth.initialize(apiKey, SharedPreferencesStore());
  // GoogleSheet().Intialization();
  // GoogleSheet().sendEmailPassword("yabdelmalak70@gmail.com","#Youssef");


  print("connection done");


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [


      BlocProvider(
        create:(context) => AppCubit()..getHistory() ,),
      BlocProvider(
        create:(context) => LoginCubit() ,),
    ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state)
        {

        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorObservers: [BotToastNavigatorObserver()],
            builder: BotToastInit(),
            theme:ThemeData(
              primaryColor:AppColors.mainBlueColor,
            ),
            home: LoginScreen() ,
          );
        },
      ),
    );
  }
}

class SharedPreferencesStore extends TokenStore {
  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  @override
  Token? read() { // Synchronous again
    final prefs = SharedPreferences.getInstance();
    prefs.then((instance) {
      final token = instance.getString('token');
      return  Token.fromMap({'token': token}) ;
    });
    return null; // This will be reached if prefs has not been completed yet
  }

  @override
  Future<void> write(Token? token) async {
    final prefs = await SharedPreferences.getInstance();
    if (token != null) {
      prefs.setString('token', token.toString());
    }
    else {
      prefs.remove('token');
    }
  }

  @override
  Future<void> delete() async { // Also asynchronous
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
