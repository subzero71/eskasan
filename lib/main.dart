import 'package:eskasan/controllers/users_controller.dart';
import 'package:eskasan/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'utils/dimensions.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UsersController usersController = Get.put(UsersController());

  @override
  Widget build(BuildContext context) {
    // İlk açılışta kullanıcıları çek
    usersController.fetchUsers();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Safirsoft",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,

            fontWeight: FontWeight.bold
          )
        ),
      ),
      home: TestPage(),
    );
  }
}
