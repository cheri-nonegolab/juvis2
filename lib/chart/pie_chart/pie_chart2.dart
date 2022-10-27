//Use 'percent_indicator' package.

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PieChart2 extends StatelessWidget {
  const PieChart2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularPercentIndicator(
              radius: 107.0,
              lineWidth: 10.0,
              percent: 1.0,
              center: new Icon(Icons.abc_sharp, size: 50, color: Colors.black),
              backgroundColor: Colors.grey,
              progressColor: Colors.red,
            ),
            CircularPercentIndicator(
              radius: 92.0,
              lineWidth: 10.0,
              percent: 0.8,
              backgroundColor: Colors.grey,
              progressColor: Colors.amber,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            CircularPercentIndicator(
              radius: 77.0,
              lineWidth: 10.0,
              percent: 0.3,
              backgroundColor: Colors.grey,
              progressColor: Colors.green,
              circularStrokeCap: CircularStrokeCap.round,
            )
          ],
        ));
  }
}
