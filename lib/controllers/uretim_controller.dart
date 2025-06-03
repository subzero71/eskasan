import 'package:deneme/models/uretim_model.dart';
import 'package:get/get.dart';

class UretimController extends GetxController {

  var selectedMachine = Rxn<UretimDropdownModel>();
  var selectedWorkOrder = Rxn<UretimDropdownModel>();
  var selectedOperation = Rxn<UretimDropdownModel>();

  var machines = <UretimDropdownModel>[].obs;
  var workOrders = <UretimDropdownModel>[].obs;
  var operations = <UretimDropdownModel>[].obs;
}

