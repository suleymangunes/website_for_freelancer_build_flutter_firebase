import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_freelance_webpage/constants/material_color.dart';
import 'package:my_freelance_webpage/constants/myconstants.dart';
import 'package:my_freelance_webpage/firebase_options.dart';
import 'package:my_freelance_webpage/pages/my_home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: MyConstants.instance.mountainMeadowLight2x,
        scaffoldBackgroundColor: Colors.transparent,
        primarySwatch: buildMaterialColor(MyConstants.instance.mountainMeadow),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 20,
          shadowColor: Colors.black38,
        ),
      ),
      title: 'Material App',
      home: const MyHomePage(),
    );
  }
}


// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const CustomInfo(),
//     );
//   }
// }

// class CustomInfo extends StatefulWidget {
//   const CustomInfo({Key? key}) : super(key: key);

//   @override
//   State<CustomInfo> createState() => _CustomInfoState();
// }

// class _CustomInfoState extends State<CustomInfo> {
//   double? width;
//   double? height;
//   Color? color;
//   bool? animate;
//   bool? textAppear;

//   @override
//   void initState() {
//     animate = false;
//     textAppear = false;
//     showInfoPlayer(animate!);
//     super.initState();
//   }

//   void showInfoPlayer(bool animate) {
//     setState(() {
//       if (animate) {
//         height = 450;
//         width = 800;
//         color = Colors.grey[500];
//         Future.delayed(const Duration(milliseconds: 300), () {
//           setState(() {
//             textAppear = true;
//           });
//         });
//       } else {
//         height = 450;
//         width = 500;
//         color = Colors.grey[500];
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: MouseRegion(
//           onEnter: (a) {
//             setState(() {
//               animate = true;
//               showInfoPlayer(animate!);
//             });
//           },
//           onExit: (a) {
//             animate = false;
//             showInfoPlayer(animate!);
//             textAppear = false;
//           },
//           child: SizedBox(
//             width: 650,
//             height: 450,
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: AnimatedContainer(
//                     height: height,
//                     width: width,
//                     duration: const Duration(milliseconds: 300),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 40.0,
//                       vertical: 60.0,
//                     ),
//                     color: color,
//                     child: AnimatedOpacity(
//                       opacity: textAppear! ? 1 : 0,
//                       duration: Duration(milliseconds: textAppear! ? 400 : 100),
//                       curve: Curves.easeOut,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "11",
//                             style: TextStyle(
//                               fontSize: 40.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const Text(
//                             "MOHAMED SALAH",
//                             style: TextStyle(
//                               fontSize: 35.0,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const Text(
//                             "Forward",
//                             style: TextStyle(
//                               fontSize: 30.0,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(top: 10.0),
//                             width: 270,
//                             child: const Text(
//                               "Mohamed Salah is one of the most prolific forwards in European football and a Champions League and Premier League winner with Liverpool.",
//                               style: TextStyle(
//                                 fontSize: 15.0,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Align(
//                   //alignment: const Alignment(0, 0),
//                   alignment: Alignment.bottomCenter,
//                   child: AnimatedContainer(
//                     padding: EdgeInsets.only(left: animate! ? 270 : 0),
//                     duration: const Duration(milliseconds: 250),
//                     height: 300,
//                     child: const Image(
//                       image: AssetImage(
//                         'assets/logo_without_pad.png',
//                       ),
//                       height: 50,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: AnimatedOpacity(
//                     opacity: textAppear! ? 0 : 1,
//                     duration: Duration(milliseconds: textAppear! ? 200 : 200),
//                     child: Container(
//                       width: width,
//                       color: const Color(0xFFF5F5F5).withOpacity(0.7),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 10.0,
//                           horizontal: 20,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: const [
//                             Text(
//                               "11",
//                               style: TextStyle(
//                                 fontSize: 40.0,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                             Text(
//                               "MOHAMED SALAH",
//                               style: TextStyle(
//                                 fontSize: 35.0,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
