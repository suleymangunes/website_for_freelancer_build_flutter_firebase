import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_freelance_webpage/constants/myconstants.dart';
import 'package:my_freelance_webpage/controller/get_controller.dart';
import 'package:my_freelance_webpage/service/auth_register.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsBodyPage extends StatefulWidget {
  const ProjectsBodyPage({super.key});

  @override
  State<ProjectsBodyPage> createState() => _ProjectsBodyPageState();
}

class _ProjectsBodyPageState extends State<ProjectsBodyPage> {
  late Future projeler;

  AuthService authService = AuthService();
  final Controller sayfaController = Get.put(Controller());

  @override
  void initState() {
    projeler = authService.projeler();
    super.initState();
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: projeler,
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
                    childAspectRatio: 0.97,
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
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data.docs[index].data()['isim'],
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(20),
                                //     color: MyConstants.instance.waikawaGray,
                                //   ),
                                //   child: Padding(
                                //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                //     child: Text(
                                //       snapshot.data.docs[index].data()['fiyat'],
                                //       style: const TextStyle(
                                //         color: Colors.white,
                                //         fontWeight: FontWeight.w500,
                                //       ),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              snapshot.data.docs[index].data()['bilgi'],
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 400,
                              child: CarouselSlider.builder(
                                  itemCount: snapshot.data.docs[index]['fotolar'].length,
                                  itemBuilder: (context, indexF, realIndex) {
                                    final int deger = snapshot.data.docs[index]['fotolar'].length;
                                    // print(deger);
                                    // print(indexF);
                                    print(snapshot.data.docs.length);
                                    print(realIndex);
                                    return Container(
                                        color: Colors.black,
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Image.network(snapshot.data.docs[index]['fotolar'][indexF]),
                                        ));
                                  },
                                  options: CarouselOptions(
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.5,
                                    autoPlay: true,
                                    pauseAutoPlayOnTouch: true,
                                    autoPlayInterval: const Duration(seconds: 2),
                                    autoPlayAnimationDuration: const Duration(seconds: 1),
                                  )),
                            ),
                            // SizedBox(
                            //   height: 230,
                            //   // width: 300,
                            //   child: Lottie.network(
                            //     snapshot.data.docs[index].data()['gif'],
                            //     fit: BoxFit.cover,
                            //     repeat: true,
                            //     filterQuality: FilterQuality.high,
                            //     animate: true,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 20,
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
                                  _launchUrl(snapshot.data.docs[index]['github']);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  child: Text(
                                    'Github',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
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
                                  sayfaController.sayfa.value = 4;
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  child: Text(
                                    'Contact Me',
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
