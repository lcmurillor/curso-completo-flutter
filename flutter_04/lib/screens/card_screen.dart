import 'package:fl_components/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Widget'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustonCardType1(),
            SizedBox(height: 10),
            CustomCardType2(
              imageUrl:
                  'https://scontent.fjap1-1.fna.fbcdn.net/v/t31.18172-8/1658139_721727101205007_521350763_o.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=OG5BDEGyaZEAX_Ml3Qr&_nc_ht=scontent.fjap1-1.fna&oh=00_AT_m2rhv5G_sU9r2zmbohK6tYuLqeiLkwIF2Hyel0lNQwA&oe=61E73177',
              name: 'Un hermoso paisaje',
            ),
            SizedBox(height: 10),
            CustomCardType2(
                imageUrl:
                    'https://interviajescostarica.com/wp-content/uploads/2021/05/landscape-mountains-sky-4843193.jpg',
                name: 'Un hermoso paisaje'),
            SizedBox(height: 10),
            CustomCardType2(
                imageUrl:
                    'https://photographylife.com/wp-content/uploads/2020/03/Dan-Ballard-Landscapes-6.jpg'),
            SizedBox(height: 10),
            CustomCardType2(
              imageUrl:
                  'https://pcpimpz.com/wp-content/uploads/2020/01/travel-landscape-01.jpg',
            ),
            SizedBox(height: 10)
          ],
        ));
  }
}
