import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_freelance_webpage/constants/myconstants.dart';
import 'package:my_freelance_webpage/controller/get_controller.dart';
import 'package:my_freelance_webpage/service/auth_register.dart';

class ServicesBodyPage extends StatefulWidget {
  const ServicesBodyPage({super.key});

  @override
  State<ServicesBodyPage> createState() => _ServicesBodyPageState();
}

class _ServicesBodyPageState extends State<ServicesBodyPage> {
  double? width;
  double? height;
  Color? color;
  bool? animate;
  bool? textAppear;

  late Future servisler;

  @override
  void initState() {
    animate = false;
    textAppear = false;
    showInfoPlayer(animate!);
    servisler = authService.servisler();
    super.initState();
  }

  void showInfoPlayer(bool animate) {
    setState(() {
      if (animate) {
        height = 450;
        width = 800;
        color = Colors.grey[500];
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            textAppear = true;
          });
        });
      } else {
        height = 450;
        width = 500;
        color = Colors.grey[500];
      }
    });
  }

  AuthService authService = AuthService();
  final Controller sayfaController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: servisler,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('baglanti hatasi');
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 30,
                      shadowColor: Colors.black87,
                      margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 40),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(35),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data.docs[index].data()['hizmet'],
                                  style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: MyConstants.instance.waikawaGray,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                    child: Text(
                                      snapshot.data.docs[index].data()['fiyat'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              snapshot.data.docs[index].data()['bilgi'],
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 250,
                              // width: 300,
                              child: Lottie.network(
                                snapshot.data.docs[index].data()['gif'],
                                fit: BoxFit.cover,
                                repeat: true,
                                filterQuality: FilterQuality.high,
                                animate: true,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered)) {
                                      return Colors.white;
                                    }

                                    return MyConstants.instance.mountainMeadow; // null throus error in flutter 2.2+.
                                  }),
                                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                                    if (states.contains(MaterialState.hovered)) {
                                      return MyConstants.instance.mountainMeadow;
                                    }
                                    return Colors.white;
                                  }),
                                  shape: MaterialStateProperty.all(
                                      StadiumBorder(side: BorderSide(color: MyConstants.instance.mountainMeadow))),
                                ),
                                onPressed: () async {
                                  sayfaController.sayfa.value = 3;
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  child: Text(
                                    'Discover More',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
          }
        });
  }
}
