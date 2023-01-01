import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_freelance_webpage/constants/myconstants.dart';
import 'package:my_freelance_webpage/controller/get_controller.dart';

class HomeBodyPage extends StatefulWidget {
  const HomeBodyPage({super.key, required this.sayfamiDonder});

  final void Function(int sayfam) sayfamiDonder;
  @override
  State<HomeBodyPage> createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 220,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/human2.jpg'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        child: Text(
                          'Hello Friend!',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      "I'm available for freelance work.",
                      style: TextStyle(
                        color: MyConstants.instance.mountainMeadow,
                        fontWeight: FontWeight.w900,
                        fontSize: 35,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonBegin(
                  sayfamiDonder: (sayfam) {
                    widget.sayfamiDonder.call(sayfam);
                  },
                )
              ],
            ),
            const SizedBox(
              width: 320,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Image.asset('assets/human.png'),
              ),
            ),
          ],
        ),
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
        widget.sayfamiDonder.call(1);
        sayfaController.sayfa.value = 1;
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
          "Let's begin",
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
