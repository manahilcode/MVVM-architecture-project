

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static void feildFocusChange(BuildContext context ,
      FocusNode current,
      FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message,
        backgroundColor:Colors.red,
      textColor: Colors.white,
      toastLength:Toast.LENGTH_LONG,


    );

  }
  static void flushBarErrorMessage(String message, context){
    showFlushbar(context: context, flushbar: Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: EdgeInsets.all(15),
flushbarPosition: FlushbarPosition.TOP,
      message: message,
      backgroundColor: Colors.red,
      reverseAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
        icon: Icon(Icons.error,size: 20,color: Colors.white,),

      duration: Duration(seconds: 3),
    )..show(context),
    );
  }
}