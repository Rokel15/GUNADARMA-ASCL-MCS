import 'package:dio/dio.dart';
import 'package:mcs_bab_8/models/card_bridge_model.dart';

class CardApiService {
  Dio dio = Dio();
  String cardBridgeUrl = "https://card-bridge-production.up.railway.app/cards";

  Future<CardBridgeModel> getUid() async {
    try{
      final response = await dio.get(cardBridgeUrl);
      return CardBridgeModel.fromJson(response.data);
    }catch(e){
      rethrow;
    }
  }
}