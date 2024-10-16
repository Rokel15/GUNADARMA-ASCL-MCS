import 'package:flutter/cupertino.dart';
import 'package:mcs_bab_8/models/card_bridge_model.dart';
import 'package:mcs_bab_8/models/servo_status_model.dart';
import 'package:mcs_bab_8/services/card_api_service.dart';
import 'package:mcs_bab_8/services/servo_api_service.dart';

class AppProvider extends ChangeNotifier{
  ServoStatusModel? servoStatusModel;
  CardBridgeModel? cardBridgeModel;
  String servoStatus = "";
  String textLeftButton = "Set Servo to 0";
  String textRightButton= "Set Servo to 1";
  Color colorLeftButton = const Color(0xffFF6500);
  Color colorRightButton = const Color(0xff1E3E62);

  Stream getServoStatus() async*{
    while(true){
      yield servoStatusModel = await ServoApiService().getServoStatus();
      await Future.delayed(const Duration(seconds: 1));
      notifyListeners();
    }
  }

  Future changeServoStatus({required String status}) async{
    await ServoApiService().writeServoStatus(status: status);
    notifyListeners();
  }

  Stream getUid() async*{
    while(true){
      yield cardBridgeModel = await CardApiService().getUid();
      await Future.delayed(const Duration(seconds: 2));
      notifyListeners();
    }
  }

  Future deleteUid({required String uid}) async{
    await CardApiService().deleteCard(idCard: uid);
    notifyListeners();
  }
}