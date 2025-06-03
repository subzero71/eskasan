// To parse this JSON data, do
//
//     final productionOperations = productionOperationsFromJson(jsonString);

import 'dart:convert';

List<ProductionOperations> productionOperationsFromJson(String str) => List<ProductionOperations>.from(json.decode(str).map((x) => ProductionOperations.fromJson(x)));

String productionOperationsToJson(List<ProductionOperations> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductionOperations {
  String id;
  String operationCode;
  String operationName;

  ProductionOperations({
    required this.id,
    required this.operationCode,
    required this.operationName,
  });

  factory ProductionOperations.fromJson(Map<String, dynamic> json) => ProductionOperations(
    id: json["Id"],
    operationCode: json["OperationCode"],
    operationName: json["OperationName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "OperationCode": operationCode,
    "OperationName": operationName,
  };
}
