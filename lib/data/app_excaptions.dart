class AppException implements Exception {
  final _message ;
  final _prefix;
  AppException([this._message,this._prefix]);
  String toString(){
    return '$_prefix$_message';
  }

}
class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message,"error During Communication");
}
class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message,"invalid request");
}
class UnauthorisedException extends AppException{
  UnauthorisedException([String? message]) : super(message,"Unauthorized request");
}
class invalidinputException extends AppException{
  invalidinputException ([String? message]) : super(message,"Unauthorized request");
}