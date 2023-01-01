import 'package:flutter/cupertino.dart';

class MyConstants {
  static MyConstants instance = MyConstants._init();
  MyConstants._init();

  final Color mountainMeadowDark = const Color.fromARGB(255, 12, 118, 88);
  final Color mountainMeadow = const Color.fromRGBO(20, 183, 137, 1);
  final Color mountainMeadowLight = const Color.fromARGB(255, 67, 202, 164);
  final Color mountainMeadowLight2x = const Color.fromARGB(255, 140, 233, 206);
  final Color mountainMeadowLight8x = const Color.fromARGB(255, 234, 255, 249);
  final Color waikawaGray = const Color.fromRGBO(83, 93, 161, 1);
  final Color waikawaGrayDark = const Color.fromARGB(255, 43, 53, 113);
}
