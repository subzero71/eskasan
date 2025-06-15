import 'package:eskasan/controllers/durus_bitir_controller.dart';
import 'package:eskasan/controllers/uretim_baslat_controller.dart';
import 'package:eskasan/controllers/users_controller.dart';
import 'package:eskasan/pages/home_page.dart';
import 'package:eskasan/utils/dimensions.dart';
import 'package:eskasan/widget/demo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DowntimeEndPage extends StatelessWidget {
  DowntimeEndPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Get
        .find<UsersController>()
        .loggedInUser
        .value;
    final DowntimeEndController downtimeEndController = Get.put(
      DowntimeEndController(),
    );
    return Scaffold(
        appBar: AppBar(title: Text("Duruş Bitir"),),
        body: Demo(
          child: Obx(() {
            if (downtimeEndController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
          
            return Padding(
              padding: EdgeInsets.all(Dimensions.height12),
              child: Column(
                //Column içerisi defaultta start geliyor ama childrendaki bir tane widget center olursa columda center gibi davranıyor.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Operatör: ${user?.username ?? "Bilinmiyor"}",style: TextStyle(fontSize: Dimensions.height12,fontWeight: FontWeight.bold),),
                  SizedBox(height: Dimensions.height50,),
                  Center(child: ElevatedButton(onPressed: (){}, child: Text("Bilgileri Getir",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.green))),
                  SizedBox(height: Dimensions.height8,),
                  Center(child: ElevatedButton(onPressed: (){Get.to(HomePage());}, child: Text("Ana Menü",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent))),
                ],
          
              ),
            );
          }
          ),
        )


    );
  }
}
