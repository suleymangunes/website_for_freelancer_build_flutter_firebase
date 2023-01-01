import 'package:email_validator/email_validator.dart';
import 'package:emailjs/emailjs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_freelance_webpage/constants/myconstants.dart';
import 'package:select_card/select_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactBodyPage extends StatefulWidget {
  const ContactBodyPage({super.key});

  @override
  State<ContactBodyPage> createState() => _ContactBodyPageState();
}

class _ContactBodyPageState extends State<ContactBodyPage> {
  final GlobalKey<FormState> globalKey = GlobalKey();

  late TextEditingController _namecontroller;
  late TextEditingController _emailcontroller;
  late TextEditingController _aboutcontroller;

  List projekonusu = [];

  @override
  void initState() {
    _namecontroller = TextEditingController();
    _emailcontroller = TextEditingController();
    _aboutcontroller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _aboutcontroller.dispose();

    super.dispose();
  }

  bool _isloading = false;
  bool gonderildi = false;

  void laod() {
    setState(() {
      _isloading = !_isloading;
    });
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  void _sendEmail() async {
    print('calsiti');
    try {
      laod();
      await EmailJS.send(
        'service_dn52z6n',
        'template_bvgzjn7',
        {
          'user_email': 'mydocumentssoftware@gmail.com',
          'name': _namecontroller.text,
          'konu': projekonusu,
          'message': _aboutcontroller.text,
          'email': _emailcontroller.text,
        },
        const Options(
          publicKey: 'H-8P9MOUPUjPXYv_X',
          privateKey: '0JOfmAbNwsINzgJQclEC_',
        ),
      );
      print('SUCCESS!');
      setState(() {
        gonderildi = true;
      });
      laod();
    } catch (error) {
      if (error is EmailJSResponseStatus) {
        print('ERROR... ${error.status}: ${error.text}');
      }
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 40),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 560,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SERVİCES',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              ServicesButton(
                                buttonTitle: 'Websites',
                                fonksiyon: () {},
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ServicesButton(
                                buttonTitle: 'Branding',
                                fonksiyon: () {},
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              ServicesButton(
                                buttonTitle: 'Ecommerce',
                                fonksiyon: () {},
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ServicesButton(
                                buttonTitle: 'SEO',
                                fonksiyon: () {},
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'STAY CONNECTED',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              FloatingActionButton.small(
                                elevation: 0,
                                hoverElevation: 3,
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                hoverColor: MyConstants.instance.mountainMeadow,
                                onPressed: () {
                                  _launchUrl('https://tr.linkedin.com/');
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.linkedin,
                                  size: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton.small(
                                elevation: 0,
                                hoverElevation: 3,
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                hoverColor: MyConstants.instance.mountainMeadow,
                                onPressed: () {
                                  _launchUrl('https://www.instagram.com/');
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.instagram,
                                  size: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton.small(
                                elevation: 0,
                                hoverElevation: 3,
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                hoverColor: MyConstants.instance.mountainMeadow,
                                onPressed: () {
                                  _launchUrl('https://twitter.com/');
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.twitter,
                                  size: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton.small(
                                elevation: 0,
                                hoverElevation: 3,
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                hoverColor: MyConstants.instance.mountainMeadow,
                                onPressed: () {
                                  _launchUrl('https://www.youtube.com/');
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.youtube,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'START A PROJECT',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'I\'m available for freelance projects.',
                            style: TextStyle(color: Colors.black54, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ABOUT',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            'Suleyman is a professional software developer. Feel free to get in touch with me.',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              wordSpacing: 5,
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          const Text(
                            'EMAİL',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextButton(
                            style: ButtonStyle(foregroundColor: MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered)) {
                                return MyConstants.instance.mountainMeadow;
                              }
                              return Colors.black54;
                            })),
                            onPressed: () {},
                            child: const Text(
                              'hello@suleyman.design',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'CALL',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            style: ButtonStyle(foregroundColor: MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered)) {
                                return MyConstants.instance.mountainMeadow;
                              }
                              return Colors.black54;
                            })),
                            onPressed: () {},
                            child: const Text(
                              '120-240-9600',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 550,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 250,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Lütfen isminizi girin.';
                                  }
                                  return null;
                                },
                                controller: _namecontroller,
                                decoration: const InputDecoration(
                                  // hintText: 'Name',
                                  label: Text('Name'),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Mail alanı boş bırakılamaz.";
                                  }
                                  if (EmailValidator.validate(value) == false) {
                                    return "Lütfen geçerli bir mail girin.";
                                  }
                                  return null;
                                },
                                controller: _emailcontroller,
                                decoration: const InputDecoration(
                                  // hintText: 'Email Adress',
                                  label: Text('Email Adress'),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SelectSingleCard(context,
                                title: 'Websites',
                                id: 'Websites',
                                imageSourceType: ImageSourceType.network,
                                image: 'https://icones.pro/wp-content/uploads/2021/05/symbole-du-globe-gris.png',
                                cardBackgroundColor: Colors.white,
                                cardSelectedColor: MyConstants.instance.mountainMeadow,
                                titleTextColor: Colors.black54, onTap: (title, id) {
                              print(id);
                              print(title);
                              setState(() {
                                projekonusu.add(title);
                              });
                            }),
                            SelectSingleCard(context,
                                title: 'Branding',
                                id: 'Branding',
                                imageSourceType: ImageSourceType.network,
                                image:
                                    'https://previews.123rf.com/images/anthonycz/anthonycz1408/anthonycz140800033/30565450-grey-light-bulb-icon-on-white-background.jpg',
                                cardBackgroundColor: Colors.white,
                                cardSelectedColor: MyConstants.instance.mountainMeadow,
                                titleTextColor: Colors.black54, onTap: (title, id) {
                              print(id);
                              print(title);
                              setState(() {
                                projekonusu.add(title);
                                // singleCardResult = title + " " + id;
                              });
                            }),
                            SelectSingleCard(context,
                                title: 'Ecommerce',
                                id: 'Ecommerce',
                                imageSourceType: ImageSourceType.network,
                                image:
                                    'https://previews.123rf.com/images/puruan/puruan1701/puruan170101257/70489783-shopping-cart-icon-in-single-grey-color-buying-ecommerce.jpg',
                                cardBackgroundColor: Colors.white,
                                cardSelectedColor: MyConstants.instance.mountainMeadow,
                                titleTextColor: Colors.black54, onTap: (title, id) {
                              print(id);
                              print(title);
                              setState(() {
                                projekonusu.add(title);
                                // singleCardResult = title + " " + id;
                              });
                            }),
                            SelectSingleCard(context,
                                title: 'SEO',
                                id: 'SEO',
                                imageSourceType: ImageSourceType.network,
                                image:
                                    'https://thumbs.dreamstime.com/b/seo-optimization-vector-icon-filled-flat-sign-mobile-concept-web-design-search-engine-gear-glyph-symbol-logo-illustration-231994852.jpg',
                                cardBackgroundColor: Colors.white,
                                cardSelectedColor: MyConstants.instance.mountainMeadow,
                                titleTextColor: Colors.black54, onTap: (title, id) {
                              print(id);
                              print(title);
                              setState(() {
                                projekonusu.add(title);
                                // singleCardResult = title + " " + id;
                              });
                            }),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Projeni tanıt lüften.';
                              }
                              return null;
                            },
                            controller: _aboutcontroller,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              // hintText: 'Tell me about project...',
                              label: Text('Tell me about project...'),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topRight,
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
                                })),
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                print('oldu');
                                print(_aboutcontroller.text);
                                print(_emailcontroller.text);
                                print(_namecontroller.text);
                                print(projekonusu);
                                _sendEmail();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                              child: _isloading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : gonderildi
                                      ? const Text(
                                          "Gönderildi",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 2,
                                            fontSize: 15,
                                          ),
                                        )
                                      : const Text(
                                          "Gönder",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 2,
                                            fontSize: 15,
                                          ),
                                        ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Copyright © 2036 ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text('Suleyman Gunes', style: TextStyle(fontWeight: FontWeight.w500)),
                  Text(' Company. All rights reserved. Design:', style: TextStyle(color: Colors.black54)),
                  Text(' Süleyman Güneş', style: TextStyle(fontWeight: FontWeight.w500))
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ServicesButton extends StatelessWidget {
  const ServicesButton({
    Key? key,
    required this.buttonTitle,
    required this.fonksiyon,
  }) : super(key: key);

  final String buttonTitle;
  final void Function() fonksiyon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.white;
          }
          return Colors.black54;
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return MyConstants.instance.mountainMeadow;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: fonksiyon,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Text(buttonTitle),
      ),
    );
  }
}
