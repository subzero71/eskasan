import 'package:eskasan/controllers/gunluk_bakim_controller.dart';
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

class DailyMaintenancePage extends StatelessWidget {
  final DailyMaintenanceController dailyMaintenanceController = Get.put(
    DailyMaintenanceController(),
  );
  final user = Get.find<UsersController>().loggedInUser.value;

  DailyMaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Günlük Bakım")),
      body: Demo(
        child: Obx(() {
          if (dailyMaintenanceController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
        
          return SingleChildScrollView(
            padding: EdgeInsets.all(Dimensions.height14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Operatör bilgisi
                Text(
                  "Operatör: ${user?.username ?? 'Bilinmiyor'}",
                  style: TextStyle(
                    fontSize: Dimensions.height12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Dimensions.height13),
        
                // Makine seçimi
                DropdownSearch<ProductionMachines>(
                  popupProps: PopupProps.menu(showSearchBox: true),
                  items: dailyMaintenanceController.machines,
                  itemAsString: (ProductionMachines? item) =>
                  item?.machineName ?? '',
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Makine Seçimi",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onChanged: (value) {
                    dailyMaintenanceController.selectedMachine.value = value;
                  },
                  selectedItem: dailyMaintenanceController.selectedMachine.value,
                ),
                SizedBox(height: Dimensions.height20),
                Text(
                    "Bakımda Yapılan İşlemler:\n(Aynı anda birden fazla seçim yapabilirsiniz.)"),
                SizedBox(height: Dimensions.height20),
        
                // Checkbox listesi
                Column(
                  children: List.generate(
                    dailyMaintenanceController.checklistItems.length,
                        (index) => CheckboxListTile(
                      title:
                      Text(dailyMaintenanceController.checklistItems[index]),
                      value: dailyMaintenanceController.checkedList[index],
                      onChanged: (bool? value) {
                        dailyMaintenanceController.toggleCheck(index);
                      },
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height12),
        
                // FloatingActionButton yerine normal buton
                Center(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.check),
                    label: Text("Seçilenleri Göster"),
                    onPressed: () {
                      final selected =
                          dailyMaintenanceController.selectedItems;
                      Get.snackbar("Seçilenler", selected.join("\n"),
                          duration: Duration(seconds: 2));
                    },
                  ),
                ),
                SizedBox(height: Dimensions.height8),
        
                // Günlük Bakımı Tamamla butonu
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      if (dailyMaintenanceController.selectedMachine.value ==
                          null) {
                        Get.snackbar("Uyarı", "Lütfen tüm alanları seçin",
                            duration: Duration(seconds: 1));
                        return;
                      }
                      if (user?.id == null) {
                        Get.snackbar("Uyarı", "Operatör Seçili Değil",
                            duration: Duration(seconds: 1));
                        return;
                      }
                      Get.snackbar("Günlük Bakım Tamamlandı", "",
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                          colorText: Colors.white);
                    },
                    child: Text(
                      "Günlük Bakımı Tamamla",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height8),
        
                // Ana Menü butonu
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(HomePage());
                    },
                    child: Text(
                      "Ana Menü",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent),
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
