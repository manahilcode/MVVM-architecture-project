import 'package:mvvm_archi_provider/data/network/BaseApiServices.dart';
import 'package:mvvm_archi_provider/data/network/NetworkApiService.dart';
import 'package:mvvm_archi_provider/res/app_url.dart';

class AuthRepository{
  BaseApiServices _apiServices=NetworkApiService();
  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response=await _apiServices.getGetApiResponse(  AppUrl.loginEndpoint, data);
      return response;
    }
    catch(e){
      throw e;
    }

  }

  Future<dynamic> signUpApi(dynamic data)async{
    try{

      dynamic response=await _apiServices.getGetApiResponse(  AppUrl.registerApiEndpoint, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }
}