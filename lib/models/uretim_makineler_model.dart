// To parse this JSON data, do
//
//     final productionMachines = productionMachinesFromJson(jsonString);

import 'dart:convert';

List<ProductionMachines> productionMachinesFromJson(String str) => List<ProductionMachines>.from(json.decode(str).map((x) => ProductionMachines.fromJson(x)));

String productionMachinesToJson(List<ProductionMachines> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductionMachines {
  String id;
  String machineCode;
  String machineName;

  ProductionMachines({
    required this.id,
    required this.machineCode,
    required this.machineName,
  });

  factory ProductionMachines.fromJson(Map<String, dynamic> json) => ProductionMachines(
    id: json["Id"],
    machineCode: json["MachineCode"],
    machineName: json["MachineName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "MachineCode": machineCode,
    "MachineName": machineName,
  };
}
