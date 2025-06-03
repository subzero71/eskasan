import 'package:deneme/controllers/uretim_baslat_controller.dart';
import 'package:deneme/models/uretim_isemri_model.dart';
import 'package:deneme/models/uretim_makineler_model.dart';
import 'package:deneme/models/uretim_model.dart';
import 'package:deneme/models/uretim_operasyon_model.dart';
import 'package:deneme/pages/uretim/uretim_zamani.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductionStartPage extends StatelessWidget {
  final ProductionStartController productionStartController = Get.put(
    ProductionStartController(),
  );

  ProductionStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = productionStartController.usersController.loggedInUser.value;

    return Scaffold(
      appBar: AppBar(title: const Text("Üretim Başlat")),
      body: Obx(() {
        if (productionStartController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Operatör (giriş yapan kullanıcı)
              Text(
                "Operatör: ${user?.username ?? 'Bilinmiyor'}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 16),

              // Makine seçimi
              DropdownSearch<ProductionMachines>(
                popupProps: PopupProps.menu(showSearchBox: true),
                items: productionStartController.machines,
                itemAsString: (ProductionMachines? item) =>
                    item?.machineName ?? '',
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Makine Seçimi",
                  ),
                ),
                onChanged: (value) {
                  productionStartController.selectedMachine.value = value;
                },
                selectedItem: productionStartController.selectedMachine.value,
              ),

              SizedBox(height: 16),

              // Operasyon seçimi
              DropdownSearch<ProductionOperations>(
                popupProps: PopupProps.menu(showSearchBox: true),
                items: productionStartController.operations,
                itemAsString: (ProductionOperations? item) =>
                    item?.operationName ?? '',
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Operasyon Seçimi",
                  ),
                ),
                onChanged: (value) {
                  productionStartController.selectedOperation.value = value;
                },
                selectedItem: productionStartController.selectedOperation.value,
              ),

              SizedBox(height: 16),

              // İş emri seçimi
              DropdownSearch<ProductionWorkOrders>(
                popupProps: PopupProps.menu(showSearchBox: true),
                items: productionStartController.workOrders,
                itemAsString: (ProductionWorkOrders? item) =>
                    item?.workOrderNo ?? '',
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "İş Emri Seçimi",
                  ),
                ),
                onChanged: (value) {
                  productionStartController.selectedWorkOrder.value = value;
                },
                selectedItem: productionStartController.selectedWorkOrder.value,
              ),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (productionStartController.selectedWorkOrder.value ==
                            null ||
                        productionStartController.selectedMachine.value ==
                            null ||
                        productionStartController.selectedOperation == null ||
                        productionStartController.selectedOperator == null) {
                      Get.snackbar("Uyarı", "Lütfen tüm alanları seçin");
                      return;
                    }
                    print("${productionStartController.selectedOperation}");
                    Get.to(ProductionTime(), arguments: {
                     // "operator": productionStartController.selectedOperator.value,
                      "user":user,
                      "machine": productionStartController.selectedMachine.value,
                      "operation":productionStartController.selectedOperation.value,
                      "workOrder":productionStartController.selectedWorkOrder.value,



                    });


                  },
                  child: Text("Başlat"),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
