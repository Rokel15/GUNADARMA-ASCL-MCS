// To parse this JSON data, do
//
//     final servoStatusModel = servoStatusModelFromJson(jsonString);

import 'dart:convert';

ServoStatusModel servoStatusModelFromJson(String str) => ServoStatusModel.fromJson(json.decode(str));

String servoStatusModelToJson(ServoStatusModel data) => json.encode(data.toJson());

class ServoStatusModel {
  List<Result> result;

  ServoStatusModel({
    required this.result,
  });

  factory ServoStatusModel.fromJson(Map<String, dynamic> json) => ServoStatusModel(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  int id;
  int srvStatus;

  Result({
    required this.id,
    required this.srvStatus,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    srvStatus: json["srv_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "srv_status": srvStatus,
  };
}