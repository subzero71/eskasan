import 'package:eskasan/models/uretim_isemri_model.dart';
import 'package:eskasan/models/uretim_makineler_model.dart';
import 'package:eskasan/models/uretim_operasyon_model.dart';
import 'package:eskasan/models/users_model.dart';
import 'package:eskasan/pages/uretim/uretim_baslat.dart';
import 'package:eskasan/utils/dimensions.dart';
import 'package:eskasan/widget/demo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductionTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.arguments ile gelen verileri al
    final args = Get.arguments as Map<String, dynamic>;
    final ProductionOperations? operation = args["operation"];
    final ProductionMachines? machine = args["machine"];
    final ProductionWorkOrders? workOrders= args["workOrder"];
    final UsersModel? user= args["user"];
  //  final ProductionOperations operator = args["operator"];

   // final operator = args["operator"];

   // final operation = args["operation"];

    // Debug çıktısı
    //print("Operator: $operator");


    return Scaffold(
      appBar: AppBar(
        title: Text("Üretim Zamanı"),
      ),
      body: Demo(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Kullanıcı: ${user?.username ?? 'Seçilmedi'}",style: TextStyle(fontSize:Dimensions.height12),),
              Text("Operasyon: ${operation?.operationName ?? 'Seçilmedi'}",style: TextStyle(fontSize:Dimensions.height12)),
              Text("Makine: ${machine?.machineName ?? 'Seçilmedi'}",style: TextStyle(fontSize:Dimensions.height12)),
              Text("İş Emri: ${workOrders?.workOrderNo ?? 'Seçilmedi'}",style: TextStyle(fontSize:Dimensions.height12)),
              //Text("opration: ${operation}"),
              SizedBox(height: 8),
              /*Text("Makine: ${machine.machinename ?? "Seçilmedi"}"),
              SizedBox(height: 8),
              Text("Operasyon: ${operation?.operationName ?? "Seçilmedi"}"),
              SizedBox(height: 8),
              Text("İş Emri: ${workOrder?.workOrderNo ?? "Seçilmedi"}"),*/
            ],
          ),
        ),
      ),
    );
  }
}
