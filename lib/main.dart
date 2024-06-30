import 'package:flutter/material.dart';
import 'package:mvvm_archi_provider/utils/routes/routes.dart';
import 'package:mvvm_archi_provider/utils/routes/routes_name.dart';
import 'package:mvvm_archi_provider/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthViewModel())
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    ),);
  }
}

