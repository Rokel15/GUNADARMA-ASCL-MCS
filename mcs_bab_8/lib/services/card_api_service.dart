import 'package:dio/dio.dart';
import 'package:mcs_bab_8/models/card_bridge_model.dart';

class CardApiService {
  Dio dio = Dio();
  String cardBridgeUrl = "https://card-bridge-production.up.railway.app";

  Future<CardBridgeModel> getUid() async {
    try{
      final response = await dio.get("${cardBridgeUrl}/cards");
      return CardBridgeModel.fromJson(response.data);
    }catch(e){
      rethrow;
    }
  }

  Future deleteCard({required String idCard}) async{
    try{
      final response = await dio.delete("${cardBridgeUrl}/delete/$idCard");
      return response.data;
    } catch(e){
      rethrow;
    }
  }
}