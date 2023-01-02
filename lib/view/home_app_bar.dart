import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:my_freelance_webpage/constants/myconstants.dart';
import 'package:my_freelance_webpage/controller/get_controller.dart';
import 'package:my_freelance_webpage/pages/sign_in_page.dart';
import 'package:my_freelance_webpage/service/auth_register.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.sayfayagit,
  }) : super(key: key);

  final void Function(int sayfasSayisi) sayfayagit;
  @override
  State<HomeAppBar> createState() => HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.9);
}

class HomeAppBarState extends State<HomeAppBar> with SingleTickerProviderStateMixin {
  final Controller controller = Get.put(Controller());
  late TabController tabcontroller;
  String? isim;

  String? icerik;

  @override
  void initState() {
    super.initState();
    tabcontroller = TabController(length: 5, vsync: this);
    authService.nameuser().then((value) {
      setState(() {
        isim = value.data()?['userName'];
        icerik = isim;
      });
    });
  }

  @override
  void dispose() {
    tabcontroller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authService.nameuser().then((value) {
      setState(() {
        isim = value.data()?['userName'];
      });
    });
  }

  AuthService authService = AuthService();

  // TabController tabController = TabController(length: 5, vsync: HomeAppBarState());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      child: Stack(
        children: [
          AppBar(
            leading: Padding(
                padding: const EdgeInsets.only(
                  top: 22,
                  left: 25,
                ),
                child: Icon(
                  Icons.webhook_outlined,
                  color: MyConstants.instance.mountainMeadow,
                  size: 38,
                )
                // Text(
                //   'First',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 30,
                //     fontWeight: FontWeight.w900,
                //   ),
                // ),
                ),
            leadingWidth: 110,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: DefaultTabController(
                    length: 5,
                    child: Column(
                      children: [
                        SizedBox(
                            height: 35,
                            width: 460,
                            child: Obx(
                              () {
                                // return Text(controller.sayfa.value.toString());

                                // controller.increment();

                                if (controller.sayfa.value == 1) {
                                  return TabbarimView(
                                    tabcontroller: tabcontroller,
                                    getc: controller,
                                    sayfa: 1,
                                  );
                                }
                                return TabbarimView(
                                  tabcontroller: tabcontroller,
                                  getc: controller,
                                  sayfa: controller.sayfa.value,
                                );
                              },
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          Positioned(
            right: 405,
            top: 18,
            child: CircleAvatar(
              backgroundColor: MyConstants.instance.mountainMeadow,
              child: IconButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.red;
                })),
                onPressed: null,
                icon: const Icon(
                  Icons.phone_in_talk_outlined,
                  color: Colors.white,
                  size: 23,
                ),
              ),
            ),
          ),
          Positioned(
            top: 17,
            right: 240,
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
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
                await FlutterPhoneDirectCaller.callNumber('05398562722');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  '120-240-9600',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          authService.issignin() == null
              ? Positioned(
                  top: 17,
                  right: 30,
                  width: 200,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.white;
                          }
                          return MyConstants.instance.mountainMeadow;
                        }),
                        foregroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.hovered)) {
                            return MyConstants.instance.mountainMeadow;
                          }
                          return Colors.white;
                        }),
                        shape: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.hovered)) {
                            return StadiumBorder(side: BorderSide(color: MyConstants.instance.mountainMeadow));
                          }
                          return RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
                        })
                        // shape: MaterialStateProperty.all(
                        //   RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        // ),
                        ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SingUpPage();
                        },
                      ));
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                )
              : Positioned(
                  top: 17,
                  right: 30,
                  width: 200,
                  child: MouseRegion(
                    onHover: (event) {
                      setState(() {
                        icerik = 'Çıkış Yap';
                      });
                    },
                    onEnter: (event) {
                      setState(() {
                        icerik = isim;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        icerik = isim;
                      });
                    },
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.hovered)) {
                              return MyConstants.instance.mountainMeadow;
                            }
                            return Colors.white;
                          }),
                          foregroundColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.hovered)) {
                              return Colors.white;
                            }
                            return MyConstants.instance.mountainMeadow;
                          }),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))

                          // MaterialStateProperty.resolveWith((states) {
                          //   if (states.contains(MaterialState.hovered)) {
                          //     return StadiumBorder(side: BorderSide(color: MyConstants.instance.mountainMeadow));
                          //   }
                          //   return RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
                          // })
                          // shape: MaterialStateProperty.all(
                          //   RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          // ),
                          ),
                      onPressed: () {
                        setState(() {
                          authService.signOut();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        child: Text(
                          icerik.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class TabbarimView extends StatefulWidget {
  const TabbarimView({
    Key? key,
    required this.tabcontroller,
    required this.getc,
    required this.sayfa,
  }) : super(key: key);

  final TabController tabcontroller;
  final Controller getc;
  final int sayfa;

  @override
  State<TabbarimView> createState() => _TabbarimViewState();
}

class _TabbarimViewState extends State<TabbarimView> {
  // @override
  // void initState() {
  //   setState(() {
  //     widget.tabcontroller.index = widget.sayfa;
  //   });
  //   super.initState();
  // }
  @override
  void didUpdateWidget(covariant TabbarimView oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('************');
    print(widget.sayfa);
    print(oldWidget.sayfa);
    print('************');
    if (widget.sayfa != oldWidget.sayfa) {
      widget.tabcontroller.index = widget.sayfa;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: widget.tabcontroller,
        onTap: (value) {
          setState(() {
            // widget.tabcontroller.index = value;
            widget.getc.sayfa.value = value;
          });
          print('*----------------');

          print('bu calisiyor${widget.tabcontroller.index}');
          print('*----------------');

          // setState(() {
          //   print('controllerea deer verilmeden calisti');
          //   print(controller.sayfa.value);
          //   // controller.sayfa.value = value;
          //   print('controllerea deer verilmdikten sonra calisti');
          //   print(controller.sayfa.value);
          //   print(tabcontroller.index);
          //   tabcontroller.index = controller.sayfa.value;
          // });
          // print('adfaf');
          // print(tabcontroller.index);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return sayfalar[value];
          //     },
          //   ),
          // );
        },
        overlayColor: MaterialStateProperty.all(MyConstants.instance.mountainMeadowLight8x),
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: Colors.grey,
        labelColor: MyConstants.instance.mountainMeadow,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
        indicatorWeight: 2,
        tabs: const [
          Tab(
            child: Text(
              'HOME',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Tab(
            child: Text(
              'ABOUT',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Tab(
            child: Text(
              'SERVICES',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Tab(
            child: Text(
              'PROJECTS',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Tab(
            child: Text(
              'CONTACT',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ]);
  }
}
