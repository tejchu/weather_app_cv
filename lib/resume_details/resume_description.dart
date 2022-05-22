import 'package:flutter/material.dart';

class ResumedescriptionCell extends StatelessWidget {
  const ResumedescriptionCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: double.infinity,
        child: Card(
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          color: Colors.black38,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Diligent problem-solver with resourceful approach to "
                      "challenges and organized style. Leverages Computer "
                      "Science expertise to manage job functions.",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
