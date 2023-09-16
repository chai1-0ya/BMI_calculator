import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  double res;
  // String? name;
  ResultPage({super.key, required this.res});

  @override
  Widget build(BuildContext context) {
    double a = double.parse(res.toStringAsFixed(2));
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Color(0xFF0A0E21),
      child: Column(
        children: [
          SizedBox(
            height: size.height / 9,
          ),
          Text(
            'Your Result:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: size.height / 7,
          ),
          Container(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 80,
                  ),
                  if (a <= 18.4)
                    Text("UNDERWEIGHT",
                        style: TextStyle(
                            color: Colors.yellow[200],
                            fontSize: 35,
                            fontWeight: FontWeight.w800)),
                  if (a > 18.4 && a <= 24.9)
                    Text("NORMAL",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 35,
                            fontWeight: FontWeight.w800)),
                  if (a > 24.9 && a <= 39.9)
                    Text("OVERWEIGHT",
                        style: TextStyle(
                            color: Colors.yellow[600],
                            fontSize: 35,
                            fontWeight: FontWeight.w800)),
                  if (a > 39.9)
                    Text("OBESE",
                        style: TextStyle(
                            color: Colors.red[900],
                            fontSize: 35,
                            fontWeight: FontWeight.w800)),
                  SizedBox(
                    height: size.height / 8,
                  ),
                  Text(
                    "$a",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            height: size.height / 2.15,
            width: size.width / 1.35,
            color: Color(0xFF191E38),
          )
        ],
      ),
    );
  }
}
