import 'package:eskasan/controllers/durus_baslat_controller.dart';
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

class DowntimeStartPage extends StatelessWidget {
  final DowntimeStartController downtimeStartController = Get.put(
    DowntimeStartController(),
  );
  final user = Get.find<UsersController>().loggedInUser.value;

  DowntimeStartPage({super.key});


  @override
  Widget build(BuildContext context) {
    final description = Get.find<DowntimeStartController>().descriptionController;

    return Scaffold(
      appBar: AppBar(title: const Text("Duruş Başlat")),
      body: Demo(
        child: Obx(() {
          if (downtimeStartController.isLoading.value) {
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
                  items: downtimeStartController.machines,
                  itemAsString: (ProductionMachines? item) =>
                  item?.machineName ?? '',
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "Makine Seçimi",labelStyle: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  onChanged: (value) {
                    downtimeStartController.selectedMachine.value = value;
                  },
                  selectedItem: downtimeStartController.selectedMachine.value,
                ),
        
                SizedBox(height: Dimensions.height13),
        
                // Operasyon seçimi
                DropdownSearch<ProductionOperations>(
                  popupProps: PopupProps.menu(showSearchBox: true),
                  items: downtimeStartController.operations,
                  itemAsString: (ProductionOperations? item) =>
                  item?.operationName ?? '',
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "Operasyon Seçimi",labelStyle: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  onChanged: (value) {
                    downtimeStartController.selectedOperation.value = value;
                  },
                  selectedItem: downtimeStartController.selectedOperation.value,
                ),
        
                SizedBox(height: Dimensions.height13),
        
                // İş emri seçimi
                DropdownSearch<ProductionWorkOrders>(
                  popupProps: PopupProps.menu(showSearchBox: true),
                  items: downtimeStartController.workOrders,
                  itemAsString: (ProductionWorkOrders? item) =>
                  item?.workOrderNo ?? '',
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "İş Emri Seçimi",labelStyle: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  onChanged: (value) {
                    downtimeStartController.selectedWorkOrder.value = value;
                  },
                  selectedItem: downtimeStartController.selectedWorkOrder.value,
                ),
                SizedBox(height: Dimensions.height13),
                DropdownSearch<ProductionWorkOrders>(
                  popupProps: PopupProps.menu(showSearchBox: true),
                  items: downtimeStartController.workOrders,
                  itemAsString: (ProductionWorkOrders? item) =>
                  item?.workOrderNo ?? '',
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "Duruş Tipi Seçimi",labelStyle: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  onChanged: (value) {
                    downtimeStartController.selectedWorkOrder.value = value;
                  },
                  selectedItem: downtimeStartController.selectedWorkOrder.value,
                ),
                SizedBox(height: Dimensions.height13),
        
                TextField(controller: description,
                  decoration: InputDecoration(
                      labelText: "Açıklama",
                      border: OutlineInputBorder()
                  ),),
                SizedBox(height: Dimensions.height20),
        
                Column(
                  children: [
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        onPressed: () {
                          if (downtimeStartController.selectedWorkOrder.value ==
                              null ||
                              downtimeStartController.selectedMachine.value ==
                                  null ||
                              downtimeStartController.selectedOperation == null ||
                              downtimeStartController.selectedOperator == null) {
                            Get.snackbar("Uyarı", "Lütfen tüm alanları seçin");
                            return;
                          }
                          print("${downtimeStartController.selectedOperation}");
                          Get.snackbar("Duruş Başlatıldı",colorText: Colors.white, "",backgroundColor: Colors.green,duration: Duration(seconds: 1));
        
        
                        },
                        child: Text("Duruş Başlat",style: TextStyle(color: Colors.white),),
        
                      ),
        
                    ),
                    SizedBox(height: Dimensions.height8,),
                    Center(child: ElevatedButton(onPressed: (){Get.to(HomePage());}, child: Text("Ana Menü",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),),)
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
