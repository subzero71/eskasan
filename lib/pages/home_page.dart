import 'package:deneme/pages/hakkimizda.dart';
import 'package:deneme/pages/test.dart';
import 'package:deneme/pages/uretim/uretim_page.dart';
import 'package:deneme/pages/uretim/uretim_zamani.dart';
import 'package:deneme/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/users_controller.dart';

class HomePage extends StatelessWidget {
  final UsersController controller = Get.find<UsersController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = controller.loggedInUser.value;

    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa",
        ),
      ),

      body: LayoutBuilder(builder: (context, cons) {
        return ConstrainedBox(constraints: BoxConstraints(
          minHeight: cons.maxHeight,
        ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: Dimensions.height275,
                  child: Image.asset("assets/uretim.png"),
                ),
                Text(user!= null ?"HOŞGELDİN ${user.username}" : "Giriş Yapan kullanıcı bulunamadı" ,style: TextStyle(fontSize: Dimensions.height14),)

              ],
            ),
          ),);
      }),


      // Drawer eklendi
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              accountName: Text(user?.username ?? "Kullanıcı"),
              accountEmail: Text("Hoşgeldin!"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  user?.username.substring(0, 1).toUpperCase() ?? "?",
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.factory),
              title: Text('Üretim'),
              onTap: () {
                Navigator.pop(context);
                Get.to(UretimPage());
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('Hakkımızda',),
              onTap: () {
                controller.loggedInUser.value = null;
                Get.to(AboutUs()); // Login sayfasına yönlendirme
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Çıkış Yap'),
              onTap: () {
                controller.loggedInUser.value = null;
                Get.offAll(TestPage()); // Login sayfasına yönlendirme
              },
            ),
          ],
        ),
      ),


    );
  }
}
