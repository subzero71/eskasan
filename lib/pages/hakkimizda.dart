import 'package:eskasan/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hakkımızda")),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(Dimensions.height8),
              child: Text(
                "Safir Yönetim ve Kurumsal Danışmanlık olarak, Türkiye'nin önde gelen yazılım ve donanım danışmanlık firmalarından biriyiz. Kuruluşumuz, müşterilerimize işlerini büyütmeleri, rekabet avantajları elde etmeleri ve iş süreçlerini optimize etmeleri konularında uzmanlık sunmaktadır. Firmamız 2018 yılında kuruldu ve o zamandan beri Türkiye'nin farklı bölgelerindeki pek çok müşteriye başarıyla hizmet vermektedir. Tecrübeli danışman ekibimiz ve geniş hizmet yelpazemizle işletmelerin büyümesine ve başarılı bir gelecek inşa etmelerine yardımcı oluyoruz.",
                style: TextStyle(fontSize: Dimensions.height11),
              ),
            ),
            Padding(
              padding:EdgeInsets.all(Dimensions.height60),
              child: SizedBox(
              child: Image.asset("assets/safirsoft.jpg"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
