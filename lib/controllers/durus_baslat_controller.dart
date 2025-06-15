import 'package:eskasan/models/uretim_isemri_model.dart';
import 'package:eskasan/models/uretim_makineler_model.dart';
import 'package:eskasan/models/uretim_model.dart';
import 'package:eskasan/models/uretim_operasyon_model.dart';
import 'package:eskasan/services/uretim_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'users_controller.dart';

class DowntimeStartController extends GetxController {
  var isLoading = false.obs;

  var selectedOperator = Rxn<UretimDropdownModel>();
  var selectedMachine = Rxn<ProductionMachines>();
  var selectedOperation = Rxn<ProductionOperations>();
  var selectedWorkOrder = Rxn<ProductionWorkOrders>();
  var descriptionController = TextEditingController();

  var machines = <ProductionMachines>[].obs;
  var operations = <ProductionOperations>[].obs;
  var workOrders = <ProductionWorkOrders>[].obs;
  var showDetails = false.obs;

  final UretimRepository uretimRepository = UretimRepository();
//  final UsersController usersController = Get.find<UsersController>();


  @override
  void onInit() {
    super.onInit();
    fetchDropdownData();
  }

  void fetchDropdownData() async {
    isLoading.value = true;
    try {
      machines.value = await uretimRepository.fetchMachines();
      operations.value = await uretimRepository.fetchOperations();
      workOrders.value = await uretimRepository.fetchWorkOrders();
    } catch (e) {
      Get.snackbar("Hata", "Dropdown verileri alınamadı: $e");
    } finally {
      isLoading.value = false;
    }
  }

}
