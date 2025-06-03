import 'dart:convert';

/// JSON string'den liste halinde UretimDropdownModel üretir
List<UretimDropdownModel> uretimDropdownModelFromJson(String str) =>
    List<UretimDropdownModel>.from(
        json.decode(str).map((x) => UretimDropdownModel.fromJson(x)));

/// UretimDropdownModel listesini JSON string'e çevirir
String uretimDropdownModelToJson(List<UretimDropdownModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Dropdown için kullanılacak model sınıfı
class UretimDropdownModel {
  final String id;
  final String workOrderNo;
  final String itemNo;

  UretimDropdownModel({
    required this.id,
    required this.workOrderNo,
    required this.itemNo,
  });

  /// JSON'dan model oluşturur — eksik alanlar varsa boş string atanır
  factory UretimDropdownModel.fromJson(Map<String, dynamic> json) {
    return UretimDropdownModel(
      id: json["Id"]?.toString() ?? '',
      workOrderNo: json["WorkOrderNo"]?.toString() ?? '',
      itemNo: json["ItemNo"]?.toString() ?? '',
    );
  }

  /// Modeli JSON formatına çevirir
  Map<String, dynamic> toJson() => {
    "Id": id,
    "WorkOrderNo": workOrderNo,
    "ItemNo": itemNo,
  };
}
