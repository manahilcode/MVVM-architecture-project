import 'package:flutter/material.dart';
import 'package:mvvm_archi_provider/utils/routes/routes_name.dart';
import 'package:mvvm_archi_provider/view/home_screen.dart';
import 'package:mvvm_archi_provider/view/login_screen.dart';
import 'package:mvvm_archi_provider/view/login_view.dart';
import 'package:mvvm_archi_provider/view/sighnup_view.dart';

class Routes{
  static MaterialPageRoute generateRoute(RouteSettings settings) {

switch(settings.name){
  case RoutesName.home:
    return MaterialPageRoute(builder:(BuildContext context) =>HomeScreen());
  case RoutesName.login:
    return MaterialPageRoute(builder:(BuildContext context) =>LoginView());
  case RoutesName.Sighnup:
    return MaterialPageRoute(builder:(BuildContext context) =>SighnUpView());
  default:
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        body: Center(
          child: Text("No routes defined"),
        ),
      );

    });
}

  }
}
