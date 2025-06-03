import 'package:deneme/controllers/uretim_baslat_controller.dart';
import 'package:deneme/pages/test.dart';
import 'package:deneme/pages/uretim_baslatdeneme.dart';
import 'package:deneme/pages/uretim/uretim_baslat.dart';
import 'package:deneme/utils/dimensions.dart';
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            SizedBox(height: Dimensions.height40),
            ElevatedButton(
              onPressed: () {},
              child: Text("Üretim Bitir",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,color: Colors.white
              ),),
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 80),
                  backgroundColor: Colors.red,elevation: 12),
            ),
            SizedBox(height: Dimensions.height40),
            ElevatedButton(
              onPressed: () {},
              child: Text("Duruş Başlat",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,color: Colors.white
              )),
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 80),
                  backgroundColor: Colors.green,elevation: 12),
            ),
            SizedBox(height: Dimensions.height40),
            ElevatedButton(
              onPressed: () {},
              child: Text("Duruş Bitir",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,color: Colors.white
              )),
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 80),
                  backgroundColor: Colors.red,elevation: 12
              ),
            ),
          ],
        ),
      ),
    );
  }
}
