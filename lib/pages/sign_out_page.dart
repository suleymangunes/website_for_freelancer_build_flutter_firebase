import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_freelance_webpage/constants/myconstants.dart';
import 'package:my_freelance_webpage/pages/sign_in_page.dart';
import 'package:my_freelance_webpage/service/auth_register.dart';

class SignOutPage extends StatefulWidget {
  const SignOutPage({Key? key}) : super(key: key);

  @override
  State<SignOutPage> createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOutPage> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _controllerMail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordAgain = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();

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
    _controllerPasswordAgain.dispose();
    _controllerName.dispose();
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
                  height: 700,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
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
                              return "Lütfen adınızı soyadınızı girin.";
                            }

                            return null;
                          },
                          controller: _controllerName,
                          decoration: const InputDecoration(
                              label: Text('Name Surname'),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.black,
                              ))),
                        ),
                        const SizedBox(
                          height: 20,
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
                            if (_controllerPassword.text != _controllerPasswordAgain.text) {
                              return "Şifreler aynı olmalıdır.";
                            } else if (value.length <= 8 &&
                                (value.contains(RegExp(r'[A-Z]')) != true) &&
                                (value.contains(RegExp(r'[0-9]')) != true)) {
                              return "• Şifre 8 karakterden büyük olmalıdır.\n• Şifre en az bir büyük harf barındırmalıdır.\n• Şifre en az bir rakam barındırmalıdır.";
                            } else if (value.length <= 8 && (value.contains(RegExp(r'[A-Z]')) != true)) {
                              return "• Şifre 8 karakterden büyük olmalıdır.\n• Şifre en az bir büyük harf barındırmalıdır.";
                            } else if (value.length <= 8 && (value.contains(RegExp(r'[0-9]')) != true)) {
                              return "• Şifre 8 karakterden büyük olmalıdır.\n• Şifre en az bir rakam barındırmalıdır.";
                            } else if ((value.contains(RegExp(r'[A-Z]')) != true) &&
                                (value.contains(RegExp(r'[0-9]')) != true)) {
                              return "• Şifre en az bir büyük harf barındırmalıdır.\n• Şifre en az bir rakam barındırmalıdır.";
                            } else if (value.contains(RegExp(r'[A-Z]')) != true) {
                              return "Şifrede en az bir büyük harf bulunmalıdır.";
                            } else if (value.contains(RegExp(r'[0-9]')) != true) {
                              return "Şifrede en az bir rakam bulunmalıdır.";
                            } else if (value.length <= 8) {
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
                        TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Şifre boş olamaz";
                            }
                            if (_controllerPassword.text != _controllerPasswordAgain.text) {
                              return "Şifreler aynı olmalıdır.";
                            }
                            return null;
                          },
                          controller: _controllerPasswordAgain,
                          decoration: const InputDecoration(
                              label: Text('Password Again'),
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
                              _auth
                                  .createPerson(
                                _controllerName.text,
                                _controllerMail.text,
                                _controllerPassword.text,
                              )
                                  .then((value) {
                                Get.to(const SingUpPage());
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
                                                    Icons.done_outline_outlined,
                                                    color: Colors.green,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'Kayıt Olundu!',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              const Text(
                                                'Hesabınız başarıyla oluşturuldu. Giriş yapabilirsiniz.',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  basildi();

                                                  Get.back();
                                                },
                                                child: const Text('Giriş Yap'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
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
                                                    'Kayıt Olunamadı!',
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
                            //     return const SignOutPage();
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
                                    "Kaydol",
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
                              'Bir hesabın var mı?',
                              style: TextStyle(color: Colors.black54),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(const SingUpPage());
                              },
                              child: const Text(
                                'Hemen Giriş Yap',
                                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                              ),
                            ),
                          ],
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
