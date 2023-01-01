import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_freelance_webpage/constants/myconstants.dart';
import 'package:my_freelance_webpage/controller/get_controller.dart';

class AboutBodyPage extends StatefulWidget {
  const AboutBodyPage({super.key});

  @override
  State<AboutBodyPage> createState() => _AboutBodyPageState();
}

class _AboutBodyPageState extends State<AboutBodyPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 450,
                    width: 700,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/calisin.jpg',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 600,
                        height: 200,
                        decoration: BoxDecoration(
                          color: MyConstants.instance.mountainMeadowDark,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'My Story',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 35, left: 20),
                              child: CircleAvatar(
                                radius: 80,
                                backgroundImage: AssetImage('assets/human2.jpg'),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 600,
                        height: 220,
                        decoration: BoxDecoration(
                          color: MyConstants.instance.waikawaGrayDark,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'a little bit about Suleyman',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '''
Bu web sitesi Flutter ile yazılmıştır. Backend olarak firebase kullanilmistir. Hazırlayan Süleyman Güneş. Flutter ile tek kodda ios, android, linux, mac, windows ve webte çalışan çıktı üretilebilir. Servisleri görmek için tiklayin.
                                ''',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              ButtonBegin(
                                sayfamiDonder: (sayfam) {},
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 200,
              ),
              const InfoAboutProjects(),
              const SizedBox(
                height: 200,
              ),
              const WorkCompanies(),
              const SizedBox(
                height: 150,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoAboutProjects extends StatelessWidget {
  const InfoAboutProjects({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 500,
      child: Row(
        children: [
          SizedBox(
            height: 400,
            width: 700,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Information',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Text(
                        'Süleyman Güneş',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Birhtday',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Text(
                        'Jan 20, 2001',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Phone',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Text(
                        '0539 856 27 22',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Text(
                        'suleyman@gunes.com',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '20+',
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Years of Experiences',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '245',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Happy Costumers',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '640',
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Project Finisher',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '72+',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Digital Awards',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonBegin extends StatefulWidget {
  const ButtonBegin({
    Key? key,
    required this.sayfamiDonder,
  }) : super(key: key);

  final void Function(int sayfam) sayfamiDonder;
  @override
  State<ButtonBegin> createState() => _ButtonBeginState();
}

class _ButtonBeginState extends State<ButtonBegin> {
  final Controller sayfaController = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return MyConstants.instance.waikawaGrayDark;
            }
            return MyConstants.instance.waikawaGray;
          }),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          )),
      onPressed: () {
        widget.sayfamiDonder.call(2);
        sayfaController.sayfa.value = 2;
        print(sayfaController.sayfa.value);
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) {
        //     return const AboutBodyPage();
        //   },
        // ));
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 17),
        child: Text(
          "Services",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}

class WorkCompanies extends StatefulWidget {
  const WorkCompanies({super.key});

  @override
  State<WorkCompanies> createState() => _WorkCompaniesState();
}

class _WorkCompaniesState extends State<WorkCompanies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Companies I've had worked",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 265,
                child: SvgPicture.asset(
                  'assets/cachet.svg',
                  semanticsLabel: 'logo',
                  width: 150,
                ),
              ),
              SizedBox(
                width: 265,
                child: SvgPicture.asset(
                  'assets/guitar-center.svg',
                  semanticsLabel: 'logo',
                  width: 150,
                ),
              ),
              SizedBox(
                width: 265,
                child: SvgPicture.asset(
                  'assets/tokico.svg',
                  semanticsLabel: 'logo',
                  width: 150,
                ),
              ),
              SizedBox(
                width: 265,
                child: SvgPicture.asset(
                  'assets/shopify.svg',
                  semanticsLabel: 'logo',
                  width: 150,
                ),
              ),
              SizedBox(
                width: 265,
                child: SvgPicture.asset(
                  'assets/profil-rejser.svg',
                  semanticsLabel: 'logo',
                  width: 150,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
