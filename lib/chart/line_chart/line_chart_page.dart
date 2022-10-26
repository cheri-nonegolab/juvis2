import 'package:flutter/material.dart';
import 'package:juvis2/chart/line_chart/line_chart1.dart';

class LineChartPage extends StatelessWidget {
  const LineChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [LineChart1()],
      ),
    );
  }
}
