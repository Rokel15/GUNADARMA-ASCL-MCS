import 'package:dio/dio.dart';

class ServoControllerService {
  Dio dio = Dio();
  String servoControllerUrl = "https://srvo-cntrllr-production.up.railway.app/servo/";

  writeServo({required String status}) async {
    try{
      dio.put("$servoControllerUrl$status");
    }catch(e){
      rethrow;
    }
  }
}