import 'package:dio/dio.dart';
import 'package:mcs_bab_8/models/servo_status_model.dart';

class ServoApiService {
  Dio dio = Dio();
  String servoControllerUrl = "https://srvo-cntrllr-production.up.railway.app";

  Future<ServoStatusModel> getServoStatus() async{
    try{
      final response = await dio.get("$servoControllerUrl/servo/status");
      return ServoStatusModel.fromJson(response.data);
    }catch(e){
      rethrow;
    }
  }

  writeServoStatus({required String status}) async {
    try{
      final response =  await dio.put("$servoControllerUrl/servo/update/$status");
      return response.data;
    }catch(e){
      rethrow;
    }
  }
}