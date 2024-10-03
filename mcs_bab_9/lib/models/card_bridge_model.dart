// To parse this JSON data, do
//
//     final cardBridgeModel = cardBridgeModelFromJson(jsonString);

import 'dart:convert';

CardBridgeModel cardBridgeModelFromJson(String str) => CardBridgeModel.fromJson(json.decode(str));

String cardBridgeModelToJson(CardBridgeModel data) => json.encode(data.toJson());

class CardBridgeModel {
  List<Result> result;

  CardBridgeModel({
    required this.result,
  });

  factory CardBridgeModel.fromJson(Map<String, dynamic> json) => CardBridgeModel(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  String id;

  Result({
    required this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
