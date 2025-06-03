// To parse this JSON data, do
//
//     final productionWorkOrders = productionWorkOrdersFromJson(jsonString);

import 'dart:convert';

List<ProductionWorkOrders> productionWorkOrdersFromJson(String str) => List<ProductionWorkOrders>.from(json.decode(str).map((x) => ProductionWorkOrders.fromJson(x)));

String productionWorkOrdersToJson(List<ProductionWorkOrders> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductionWorkOrders {
  String id;
  String workOrderNo;
  String itemNo;

  ProductionWorkOrders({
    required this.id,
    required this.workOrderNo,
    required this.itemNo,
  });

  factory ProductionWorkOrders.fromJson(Map<String, dynamic> json) => ProductionWorkOrders(
    id: json["Id"],
    workOrderNo: json["WorkOrderNo"],
    itemNo: json["ItemNo"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "WorkOrderNo": workOrderNo,
    "ItemNo": itemNo,
  };
}
