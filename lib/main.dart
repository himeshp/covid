import 'package:covid/providers/auth.dart';
import 'package:covid/screens/home.dart';
import 'package:covid/screens/login.dart';
import 'package:covid/screens/on_boarding.dart';
import 'package:covid/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
  ChangeNotifierProvider.value(value: AuthProvider.initialize())
],
child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Corona Out',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreensController()
    );
  }
}


class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    if(auth.status == Status.Uninitialized){
      return Splash();
    }else{
      if(auth.logedIn){
        return Home();
      }else{
        if(auth.firstOpen){
          return OnBoarding();
        }else{
          return Login();
        }
      }
    }

//    switch(auth.status){
//      case Status.Uninitialized:
//        return Splash();
//      case Status.Unauthenticated:
//      case Status.Authenticating:
//        if(auth.firstOpen){
//          return OnBoarding();
//        }
//        return Login();
//        break;
//      case Status.Authenticated:
//        return Home();
//      default:    return Login();
//    }
  }
}

