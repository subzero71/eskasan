import 'dart:convert';
import 'package:deneme/models/uretim_isemri_model.dart';
import 'package:deneme/models/uretim_makineler_model.dart';
import 'package:deneme/models/uretim_model.dart';
import 'package:deneme/models/uretim_operasyon_model.dart';
import 'package:deneme/models/users_model.dart';
import 'package:http/http.dart' as http;

class UretimRepository {

  Future<List<ProductionMachines>> fetchMachines() async {
    final response = await http.get(Uri.parse("https://safirkurumsal.com/api/getMachines.php"));
    if (response.statusCode == 200) {
      return productionMachinesFromJson(response.body);
    } else {
      throw Exception("Makine verileri alınamadı");
    }
  }

  Future<List<ProductionOperations>> fetchOperations() async {
    final response = await http.get(Uri.parse("https://safirkurumsal.com/api/getOperations.php"));
    if (response.statusCode == 200) {
      return productionOperationsFromJson(response.body);
    } else {
      throw Exception("Operasyon verileri alınamadı");
    }
  }

  Future<List<ProductionWorkOrders>> fetchWorkOrders() async {
    final response = await http.get(Uri.parse("https://safirkurumsal.com/api/getWorkOrders.php"));
    if (response.statusCode == 200) {
      return productionWorkOrdersFromJson(response.body);
    } else {
      throw Exception("İş emirleri alınamadı");
    }
  }
}
