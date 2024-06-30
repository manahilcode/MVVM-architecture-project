



import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_archi_provider/respository/auth_repository.dart';
import 'package:mvvm_archi_provider/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading=false;
  bool get loading=>_loading;

  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

  bool _SignUploading=false;
  bool get SignUploading=>_SignUploading;

  setSignUpLoading(bool value){
    _SignUploading  =value;
    notifyListeners();
  }




  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      Utils.flushBarErrorMessage("login Sucessfully", context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {

      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);

        print(error.toString());
      } }
    );

  }
  Future<void> SignUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(false);
    _myRepo.signUpApi(data).then((value) {
      Utils.flushBarErrorMessage("SignUp Sucessfully", context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);

        print(error.toString());
      } }
    );
  }
}