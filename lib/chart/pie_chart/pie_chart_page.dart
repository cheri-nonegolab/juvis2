import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:juvis2/chart/line_chart/line_chart1.dart';
import 'package:juvis2/chart/pie_chart/pie_chart1.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [PieChart1()],
      ),
    );
  }
}
