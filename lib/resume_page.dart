import 'package:challenge/resume_details/resume_contact_info.dart';
import 'package:challenge/resume_details/resume_description.dart';
import 'package:challenge/resume_details/resume_image.dart';
import 'package:challenge/resume_details/resume_title.dart';
import 'package:flutter/material.dart';
import 'navbar/nav_bar.dart';
import 'navbar/nav_drawer.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Container(
          child: Column(
              children: [
                NavBar(),
                ResumeTitleCell(),
                Expanded(
                  child: Column(
                    children: [
                      Row(children: [
                        ResumeImageCell(),
                        ContactInfoCell(),
                      ]),
                      ResumedescriptionCell(),
                  ],
          ),
        ),
      ])),
    );
  }
}
