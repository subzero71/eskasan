import 'package:eskasan/controllers/ariza_talep_controller.dart';
import 'package:eskasan/controllers/uretim_baslat_controller.dart';
import 'package:eskasan/controllers/users_controller.dart';
import 'package:eskasan/models/uretim_isemri_model.dart';
import 'package:eskasan/models/uretim_makineler_model.dart';
import 'package:eskasan/models/uretim_model.dart';
import 'package:eskasan/models/uretim_operasyon_model.dart';
import 'package:eskasan/pages/home_page.dart';
import 'package:eskasan/pages/uretim/uretim_page.dart';
import 'package:eskasan/pages/uretim/uretim_zamani.dart';
import 'package:eskasan/utils/dimensions.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:eskasan/widget/demo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaultReportPage extends StatelessWidget {

 // ArizaTalepPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FaultRequestController faultRequestController = Get.put(FaultRequestController());
    final user = Get.find<UsersController>().loggedInUser.value;
    final description = Get.find<FaultRequestController>().descriptionController;

    return Scaffold(
      appBar: AppBar(title: const Text("Arıza Talep")),
      body: Demo(
        child: Obx(() {
          if (faultRequestController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
        
          return Padding(
            padding: EdgeInsets.all(Dimensions.height12),
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
        
                SizedBox(height: Dimensions.height14),
        
                // Makine seçimi
                DropdownSearch<ProductionMachines>(
                  popupProps: PopupProps.menu(showSearchBox: true),
                  items: faultRequestController.machines,
                  itemAsString: (ProductionMachines? item) =>
                  item?.machineName ?? '',
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Makine Seçimi",labelStyle: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  onChanged: (value) {
                    faultRequestController.selectedMachine.value = value;
                  },
                  selectedItem: faultRequestController.selectedMachine.value,
                ),
        
                SizedBox(height: Dimensions.height20),
                // İş emri seçimi
                DropdownSearch<ProductionWorkOrders>(
                  popupProps: PopupProps.menu(showSearchBox: true),
                  items: faultRequestController.workOrders,
                  itemAsString: (ProductionWorkOrders? item) =>
                  item?.workOrderNo ?? '',
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "İş Emri Seçimi",labelStyle: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  onChanged: (value) {
                    faultRequestController.selectedWorkOrder.value = value;
                  },
                  selectedItem: faultRequestController.selectedWorkOrder.value,
                ),
                SizedBox(height: Dimensions.height20),
                TextField(controller: description,
                decoration: InputDecoration(
                  labelText: "Açıklama",
                  border: OutlineInputBorder()
                ),),
        
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: Dimensions.height20,),
                      ElevatedButton(
                        onPressed: () {
                          if (faultRequestController.selectedWorkOrder.value ==
                              null ||
                              faultRequestController.selectedMachine.value ==
                                  null ||
                              faultRequestController.selectedOperation == null ||
                              faultRequestController.selectedOperator == null) {
                            Get.snackbar("Uyarı", "Lütfen tüm alanları seçin");
                            return;
                          }
                          Get.snackbar("    Arıza Talep kaydı oluşturuldu","",
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                            duration: Duration(seconds: 1),);
                          faultRequestController.showDetails.value = true;
                          print("${faultRequestController.selectedOperation}");
        
        
                        },
                        child: Text("Arıza Talep Oluştur",style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      ),
                      SizedBox(height: Dimensions.height8,),
                      ElevatedButton(onPressed: (){Get.to(HomePage());}, child: Text("Ana Menü",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),),
                      
                      Obx(() {
                        if (!faultRequestController.showDetails.value) return SizedBox.shrink();
        
                        final workOrder = faultRequestController.selectedWorkOrder.value;
                        final machine = faultRequestController.selectedMachine.value;
        
        
                        return Padding(
                          padding: EdgeInsets.only(top: Dimensions.height16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Center(child: Icon(Icons.check_box,color: Colors.green,)),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Makine: ",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: machine?.machineName ?? '',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "İş Emri: ",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: workOrder?.workOrderNo ?? '',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Açıklama: ",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: description.text,
                                        ),
                                      ],
                                    ),
                                  ),
        
                                ],
                              ),
        
        
        
        
                            ],
                          ),
                        );
                      }),
        
        
        
        
        
        
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
