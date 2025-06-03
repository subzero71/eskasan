import 'package:deneme/models/uretim_isemri_model.dart';
import 'package:deneme/models/uretim_makineler_model.dart';
import 'package:deneme/models/uretim_model.dart';
import 'package:deneme/models/uretim_operasyon_model.dart';
import 'package:deneme/services/uretim_repository.dart';
import 'package:get/get.dart';


import 'users_controller.dart';

class ProductionStartController extends GetxController {
  var isLoading = false.obs;

  var selectedOperator = Rxn<UretimDropdownModel>();
  var selectedMachine = Rxn<ProductionMachines>();
  var selectedOperation = Rxn<ProductionOperations>();
  var selectedWorkOrder = Rxn<ProductionWorkOrders>();

  var machines = <ProductionMachines>[].obs;
  var operations = <ProductionOperations>[].obs;
  var workOrders = <ProductionWorkOrders>[].obs;

  final UsersController usersController = Get.find<UsersController>();
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
      operations.value = await uretimRepository.fetchOperations();
      workOrders.value = await uretimRepository.fetchWorkOrders();
    } catch (e) {
      Get.snackbar("Hata", "Dropdown verileri alınamadı: $e");
    } finally {
      isLoading.value = false;
    }
  }

}
