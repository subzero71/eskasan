import 'package:eskasan/controllers/uretim_baslat_controller.dart';
import 'package:eskasan/controllers/users_controller.dart';
import 'package:eskasan/models/uretim_isemri_model.dart';
import 'package:eskasan/models/uretim_makineler_model.dart';
import 'package:eskasan/models/uretim_model.dart';
import 'package:eskasan/models/uretim_operasyon_model.dart';
import 'package:eskasan/pages/home_page.dart';
import 'package:eskasan/pages/uretim/uretim_zamani.dart';
import 'package:eskasan/utils/dimensions.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:eskasan/widget/demo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductionStartPage extends StatelessWidget {
  final ProductionStartController productionStartController = Get.put(
    ProductionStartController(),
  );
  final user = Get.find<UsersController>().loggedInUser.value;

  ProductionStartPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Üretim Başlat")),
      body: Demo(
        child: Obx(() {
          if (productionStartController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
        
          return Padding(
            padding: EdgeInsets.all(Dimensions.height14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Operatör (giriş yapan kullanıcı)
                Text(
                  "Operatör: ${user?.username ?? 'Bilinmiyor'}",
                  style:  TextStyle(
                    fontSize: Dimensions.height12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        
                SizedBox(height:Dimensions.height13),
        
                // Makine seçimi
                DropdownSearch<ProductionMachines>(
                  popupProps: PopupProps.menu(showSearchBox: true),
                  items: productionStartController.machines,
                  itemAsString: (ProductionMachines? item) =>
                      item?.machineName ?? '',
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Makine Seçimi",labelStyle: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  onChanged: (value) {
                    productionStartController.selectedMachine.value = value;
                  },
                  selectedItem: productionStartController.selectedMachine.value,
                ),
        
                SizedBox(height: Dimensions.height13),
        
                // Operasyon seçimi
                DropdownSearch<ProductionOperations>(
                  popupProps: PopupProps.menu(showSearchBox: true),
                  items: productionStartController.operations,
                  itemAsString: (ProductionOperations? item) =>
                      item?.operationName ?? '',
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Operasyon Seçimi",labelStyle: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  onChanged: (value) {
                    productionStartController.selectedOperation.value = value;
                  },
                  selectedItem: productionStartController.selectedOperation.value,
                ),
        
                SizedBox(height: Dimensions.height13),
        
                // İş emri seçimi
                DropdownSearch<ProductionWorkOrders>(
                  popupProps: PopupProps.menu(showSearchBox: true),
                  items: productionStartController.workOrders,
                  itemAsString: (ProductionWorkOrders? item) =>
                      item?.workOrderNo ?? '',
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "İş Emri Seçimi",labelStyle: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  onChanged: (value) {
                    productionStartController.selectedWorkOrder.value = value;
                  },
                  selectedItem: productionStartController.selectedWorkOrder.value,
                ),
                SizedBox(height: Dimensions.height20),
        
                Column(
                  children: [
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
                        child: Text("Başlat",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(height: Dimensions.height8,),
                    Center(
                      child: ElevatedButton(onPressed: (){Get.to(HomePage());}, child: Text("Ana Menü",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),),
                    )
        
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
