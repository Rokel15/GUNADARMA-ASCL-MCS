import 'package:flutter/cupertino.dart';
import 'package:mcs_bab_8/models/card_bridge_model.dart';
import 'package:mcs_bab_8/services/card_api_service.dart';

class CardBridgeProvider extends ChangeNotifier{

  CardBridgeModel? cardBridgeModel;
  Future getUid() async {
    notifyListeners();
    return cardBridgeModel = await CardApiService().getUid();
  }
}