import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/screens/result_screen.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPurush = false, isMahila = false;

  double age = 20, weight = 50, _value = 70;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          backgroundColor: const Color(0xFF1A1F38)),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Color(0xFF0A0E21),
        // child: Padding(
        // padding: const EdgeInsets.all(12.0),
        // child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(
                  height: size.height / 15,
                ),
                Row(
                  //for male & female option
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isPurush = true;
                          isMahila = false;
                        });
                      },
                      child: Container(
                        //for male
                        width: size.width / 3,
                        height: size.height / 6,
                        decoration: ShapeDecoration(
                          color: isPurush ? Colors.red : Color(0xFF1A1F38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/venus.svg",
                              height: 86,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "PURUSH",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                    ), // male
                    SizedBox(
                      //for space between
                      width: size.width / 6,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isMahila = true;
                          isPurush = false;
                        });
                      },
                      child: Container(
                        //for female
                        width: size.width / 3,
                        height: size.height / 6,
                        decoration: ShapeDecoration(
                          color: isMahila ? Colors.red : Color(0xFF1A1F38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/mars.svg",
                              height: 86,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "MAHILA",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                    ), // female
                  ],
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                Container(
                  //for height
                  width: size.width - 80,
                  height: size.height / 6,
                  decoration: ShapeDecoration(
                    color: Color(0xFF1A1F38),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "HEIGHT",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "CM",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      SfSliderTheme(
                        data: SfSliderThemeData(
                          // thumbColor: Colors.red,
                          tooltipBackgroundColor: Colors.red,
                          // thumbStrokeColor: Colors.red
                        ),
                        child: SfSlider(
                            value: _value,
                            min: 0,
                            max: 250,
                            // interval: 10,
                            // showTicks: true,
                            // showLabels: true,
                            enableTooltip: true,
                            tooltipShape: const SfPaddleTooltipShape(),
                            activeColor: Color(0x60BB86FC),
                            // numberFormat: NumberFormat("cm"),
                            onChanged: (newValue) {
                              setState(() {
                                _value = newValue;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                Row(
                  //for weight & age
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    detailbox("WEIGHT", true, size.height / 6, size.width / 3),
                    SizedBox(
                      width: size.width / 6,
                    ),
                    detailbox("AGE", false, size.height / 6, size.width / 3),
                  ],
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            res: (weight / (_value * _value)) * 10000,
                          )),
                );
                // Navigator.pushNamed(context, "result");
              },
              child: Container(
                //calculate button
                height: 84,
                width: double.infinity,
                color: Colors.red,
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Calculate",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        // ),
        // ),
      ),
    );
  }

  detailbox(String text, bool isWeight, double x, double y) {
    int a = weight.toInt();
    int b = age.toInt();
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: y,
        height: x,
        decoration: ShapeDecoration(
          color: const Color(0xFF1A1F38),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              isWeight ? "$a" : "$b",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (isWeight) {
                      setState(() {
                        if (weight > 0) weight--;
                      });
                    } else {
                      setState(() {
                        if (age > 0) age--;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    if (isWeight) {
                      setState(() {
                        if (weight >= 0) weight++;
                      });
                    } else {
                      setState(() {
                        if (age >= 0) age++;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                    size: 36,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
