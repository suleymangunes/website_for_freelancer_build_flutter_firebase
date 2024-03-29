import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_freelance_webpage/constants/myconstants.dart';
import 'package:my_freelance_webpage/pages/my_home_page.dart';
import 'package:my_freelance_webpage/pages/sign_out_page.dart';
import 'package:my_freelance_webpage/service/auth_register.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _controllerMail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool _butstate = false;

  basildi() {
    setState(() {
      _butstate = !_butstate;
      print('olud ');
      print(_butstate);
    });
  }

  final FirebaseAuth _authFire = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    _controllerMail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

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
        Scaffold(
          body: Form(
            key: _formkey,
            child: Center(
              child: Card(
                elevation: 30,
                shadowColor: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  height: 600,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Icon(
                            Icons.webhook_outlined,
                            color: MyConstants.instance.mountainMeadow,
                            size: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Mail alanı boş bırakılamaz.";
                            }
                            if (EmailValidator.validate(value) == false) {
                              return "Lütfen geçerli bir mail girin.";
                            }
                            return null;
                          },
                          controller: _controllerMail,
                          decoration: const InputDecoration(
                              label: Text('Email'),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.black,
                              ))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Şifre boş olamaz";
                            }
                            if (value.length <= 8) {
                              return "Şifre 8 karakterden büyük olmalıdır.";
                            }
                            return null;
                          },
                          controller: _controllerPassword,
                          decoration: const InputDecoration(
                              label: Text('Password'),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.black,
                              ))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
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
                            if (_formkey.currentState!.validate()) {
                              basildi();
                              _auth.signIn(_controllerMail.text, _controllerPassword.text).then((value) {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const MyHomePage();
                                  },
                                ));
                                // Get.back();
                              }).onError((error, stackTrace) {
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: SizedBox(
                                          height: 150,
                                          width: 300,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.error_outline_outlined,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'Giriş Yapılamadı!',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                error.toString().split('] ')[1],
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  basildi();

                                                  Get.back();
                                                },
                                                child: const Text('Tekrar Dene'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                            }
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) {
                            //     return const SingUpPage();
                            //   },
                            // ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                            child: _butstate
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Giriş Yap",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 2,
                                      fontSize: 15,
                                    ),
                                  ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Bir hesabın yok mu?',
                              style: TextStyle(color: Colors.black54),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(const SignOutPage());
                              },
                              child: const Text(
                                'Hemen Kaydol',
                                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
