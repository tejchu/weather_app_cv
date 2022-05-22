import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactInfoCell extends StatelessWidget {
  const ContactInfoCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 400,
        margin: EdgeInsets.only(right: 10),
        color: Colors.black38,
        child: Padding(
          padding: EdgeInsets.only(
            top: 70,
            left: 40,
            right: 40,
          ),
          child: Center(
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '\nAddress: College Ring 6/B-316, Bremen, 28759, Germany',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url =
                                "https://www.google.com/maps/place/Mercator+College,+College+Ring,+28759+Bremen/@53.1665942,8.6530881,17z/data=!4m13!1m7!3m6!1s0x47b12c9f229d1c9f:0x6cbc2e23d2aedb2c!2sCollege+Ring+6,+28759+Bremen!3b1!8m2!3d53.1665942!4d8.6552768!3m4!1s0x47b12c9f19b3c3a7:0xd2017a4c466309ac!8m2!3d53.1665033!4d8.6553607";
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      TextSpan(
                        text: '\nPhone: +4917626001562',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url = "https://www.o2online.de/";
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      TextSpan(
                        text: '\nEmail: tstefanovs@jacobs-university.de',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url =
                                "https://www.microsoft.com/en-us/microsoft-365/outlook/outlook-for-business";
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      TextSpan(
                        text:
                            '\nLinkedin: https://www.linkedin.com/in/tea-stefanovska',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url =
                                "https://www.linkedin.com/in/tea-stefanovska/";
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      TextSpan(
                        text: '\nGithub: https://github.com/tejchu',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url = "https://github.com/tejchu";
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
