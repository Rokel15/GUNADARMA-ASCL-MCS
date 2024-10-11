import 'package:flutter/cupertino.dart';
import 'package:mcs_bab_8/models/card_bridge_model.dart';
import 'package:mcs_bab_8/services/card_api_service.dart';

class CardBridgeProvider extends ChangeNotifier{
  CardBridgeModel? cardBridgeModel;

  Stream getUid() async*{
    while(true){
      yield cardBridgeModel = await CardApiService().getUid();
      await Future.delayed(const Duration(seconds: 2));
      notifyListeners();
    }
  }

  // Future getTt() async{
  //   await CardApiService().getUid();
  //   notifyListeners();
  // }


  Future deleteUid({required String uid}) async{
    await CardApiService().deleteCard(idCard: uid);
    notifyListeners();
  }
}