import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_freelance_webpage/controller/get_controller.dart';
import 'package:my_freelance_webpage/pages/body_pages/about.dart';
import 'package:my_freelance_webpage/pages/body_pages/contact.dart';
import 'package:my_freelance_webpage/pages/body_pages/home.dart';
import 'package:my_freelance_webpage/pages/body_pages/projects.dart';
import 'package:my_freelance_webpage/pages/body_pages/services.dart';
import 'package:my_freelance_webpage/view/home_app_bar.dart';

import '../service/auth_register.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthService authService = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> kaydol() async {
    await authService.createPerson('suleyman', 'suleymangunes@gmail.com', 'Su1eyman.4');
  }

  Future<void> veriGonder() async {
    await _firestore.collection('verilerim').doc('0').set({'veri': 'degerim2'});
  }

  List sayfalar = [
    HomeBodyPage(
      sayfamiDonder: (sayfam) {},
    ),
    const AboutBodyPage(),
    const ServicesBodyPage(),
    const ProjectsBodyPage(),
    const ContactBodyPage(),
  ];

  int sayfam = 0;

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // print(oldWidget.sa)
  }

  final Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/arka_plan_son.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(appBar: HomeAppBar(
          sayfayagit: (sayfasSayisi) {
            setState(() {
              sayfam = sayfasSayisi;
            });
          },
        ), body: Obx(
          () {
            return sayfalar[c.sayfa.value];
          },
        )),
      ],
    );
  }
}
