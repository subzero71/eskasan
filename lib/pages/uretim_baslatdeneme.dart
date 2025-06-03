/*import 'package:deneme/controllers/uretim_controller.dart';
import 'package:deneme/pages/test.dart';
import 'package:deneme/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/users_controller.dart';

class UretimBaslat extends StatelessWidget {
  final UsersController usersController = Get.find<UsersController>();
  final UretimController uretimController = Get.find<UretimController>();


  UretimBaslat({super.key});

  @override
  Widget build(BuildContext context) {
    final user= usersController.loggedInUser.value;

    return Scaffold(
      appBar: AppBar(
        shape: Border.all(),
        backgroundColor: Colors.orange,
        title: Text("Üretim Başlat",style: TextStyle(
            fontSize: Dimensions.height18,
            color: Colors.white
        )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => Text("Operatör: ${usersController.loggedInUser.value?.username ?? ''}")),
            SizedBox(height: 20),
            Obx(() => DropdownButton<UretimDropdownModel>(
              isExpanded: true,
              value: uretimController.selectedMachine.value,
              hint: Text("Makina Seçimi"),
              items: uretimController.machines
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e.name),
              ))
                  .toList(),
              onChanged: (val) => uretimController.selectedMachine.value = val,
            )),
            SizedBox(height: 20),
            Obx(() => DropdownButton<UretimDropdownModel>(
              isExpanded: true,
              value: uretimController.selectedWorkOrder.value,
              hint: Text("İş Emri Seçimi"),
              items: uretimController.workOrders
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e.name),
              ))
                  .toList(),
              onChanged: (val) => uretimController.selectedWorkOrder.value = val,
            )),
            SizedBox(height: 20),
            Obx(() => DropdownButton<UretimDropdownModel>(
              isExpanded: true,
              value: uretimController.selectedOperation.value,
              hint: Text("Operasyon Seçimi"),
              items: uretimController.operations
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e.name),
              ))
                  .toList(),
              onChanged: (val) => uretimController.selectedOperation.value = val,
            )),
          ],
        ),
      ),
    );
  }
}
*/