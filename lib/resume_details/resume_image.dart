import 'package:flutter/material.dart';

class ResumeImageCell extends StatelessWidget {
  const ResumeImageCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          elevation: 5,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: EdgeInsets.only(left: 10, right: 0, top: 0),
          color: Colors.black38,
          child: Image.asset('assets/Img83205.jpg'),
        ));
  }
}
