import 'package:eskasan/controllers/uretim_baslat_controller.dart';
import 'package:eskasan/pages/test.dart';
import 'package:eskasan/pages/uretim/ariza_talep.dart';
import 'package:eskasan/pages/uretim/durus_baslat.dart';
import 'package:eskasan/pages/uretim/durus_bitir.dart';
import 'package:eskasan/pages/uretim/gunluk_bakim.dart';
import 'package:eskasan/pages/uretim/uretim_bitir.dart';
import 'package:eskasan/pages/uretim/uretim_baslat.dart';
import 'package:eskasan/utils/dimensions.dart';
import 'package:eskasan/widget/demo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/users_controller.dart';

class UretimPage extends StatelessWidget {
  final UsersController controller = Get.find<UsersController>();

  UretimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Üretim",),
      ),
      body: Demo(
        child: SizedBox.expand(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // Sadece çocukların kapladığı alan kadar yer kaplar
            children: [
              ElevatedButton(
                onPressed: () {Get.to(ProductionStartPage());},
                child: Text("Üretim Başlat",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,color: Colors.white
                )),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200,80),
                  backgroundColor: Colors.green,
                  elevation: 12
                ),
              ),
             // SizedBox(height: Dimensions.height40),
              ElevatedButton(
                onPressed: () {
                  Get.to(FinishProduction());
                },
                child: Text("Üretim Bitir",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,color: Colors.white
                ),),
                style: ElevatedButton.styleFrom(minimumSize: Size(200, 80),
                    backgroundColor: Colors.red,elevation: 12),
              ),
             // SizedBox(height: Dimensions.height40),
              ElevatedButton(
                onPressed: () {Get.to(DowntimeStartPage());},
                child: Text("Duruş Başlat",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,color: Colors.white
                )),
                style: ElevatedButton.styleFrom(minimumSize: Size(200, 80),
                    backgroundColor: Colors.green,elevation: 12),
              ),
             // SizedBox(height: Dimensions.height40),
              ElevatedButton(
                onPressed: () {Get.to(DowntimeEndPage());},
                child: Text("Duruş Bitir",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,color: Colors.white
                )),
                style: ElevatedButton.styleFrom(minimumSize: Size(200, 80),
                    backgroundColor: Colors.red,elevation: 12
                ),
              ),
              ElevatedButton(
                onPressed: () {Get.to(DailyMaintenancePage());},
                child: Text("Günlük Bakım",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,color: Colors.white
                ),),
                style: ElevatedButton.styleFrom(minimumSize: Size(200, 80),
                    backgroundColor: Colors.green,elevation: 12),
              ),
              ElevatedButton(
                onPressed: () {Get.to(FaultReportPage());},
                child: Text("Arıza Talep",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,color: Colors.white
                ),),
                style: ElevatedButton.styleFrom(minimumSize: Size(200, 80),
                    backgroundColor: Colors.red,elevation: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
