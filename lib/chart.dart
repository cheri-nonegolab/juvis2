import 'package:flutter/material.dart';
import 'package:juvis2/chart/line_chart/line_chart1.dart';
import 'package:juvis2/chart/line_chart/line_chart_page.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [LineChartPage()],
      ),
    );
  }
}
