import 'package:eskasan/models/uretim_isemri_model.dart';
import 'package:eskasan/models/uretim_makineler_model.dart';
import 'package:eskasan/models/uretim_model.dart';
import 'package:eskasan/models/uretim_operasyon_model.dart';
import 'package:eskasan/services/uretim_repository.dart';
import 'package:eskasan/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaultRequestController extends GetxController {

  var selectedOperator = Rxn<UretimDropdownModel>();
  var selectedMachine = Rxn<ProductionMachines>();
  var selectedOperation = Rxn<ProductionOperations>();
  var selectedWorkOrder = Rxn<ProductionWorkOrders>();
  var showDetails = false.obs;


  var descriptionController = TextEditingController();
  var machines = <ProductionMachines>[].obs;
  var workOrders = <ProductionWorkOrders>[].obs;
  var isLoading = false.obs;

  final UretimRepository uretimRepository = UretimRepository();




  @override
  void onInit() {
    super.onInit();
    fetchDropdownData();
  }

  void fetchDropdownData() async {
    isLoading.value = true;
    try {
      machines.value = await uretimRepository.fetchMachines();
      workOrders.value = await uretimRepository.fetchWorkOrders();
    } catch (e) {
      Get.snackbar("Hata", "Dropdown verileri alınamadı: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
