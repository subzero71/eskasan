import 'package:deneme/controllers/users_controller.dart';
import 'package:deneme/pages/home_page.dart';
import 'package:deneme/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestPage extends StatelessWidget {
  final UsersController controller = Get.find<UsersController>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Giriş'
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Center(
          child: Padding(
           padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Image.asset("assets/safirsoft.jpg"),
                ),
                SizedBox(height: Dimensions.height16),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: 'Kullanıcı Adı'),
                  onChanged: (val) => controller.enteredUsername.value = val,
                ),
                SizedBox(height: Dimensions.height16),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Şifre'),
                  obscureText: true,
                  onChanged: (val) => controller.enteredPassword.value = val,
                ),
                SizedBox(height: 16),
                Text(
                  'Girilen Kullanıcı Adı: ${controller.enteredUsername.value}',
                ),
                Text('Girilen Şifre: ${controller.enteredPassword.value}'),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final success = controller.login(
                      controller.enteredUsername.value,
                      controller.enteredPassword.value,
                    );

                    if (success) {
                      Get.snackbar(
                        'Giriş Başarılı',
                        "",
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        duration: Duration(seconds: 1),
                      );
                      Get.to(HomePage());
                    } else {
                      Get.snackbar(
                        'Hata',
                        controller.loginError.value,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        duration: Duration(seconds: 1),
                      );
                    }
                  },
                  child: Text('Giriş Yap'),
                ),
                SizedBox(height: 16),
                if (controller.loginError.value.isNotEmpty)
                  Text(
                    controller.loginError.value,
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
