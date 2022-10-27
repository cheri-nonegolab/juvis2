import 'dart:ui';

import 'package:juvis2/chart/pie_chart//indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChart1 extends StatefulWidget {
  const PieChart1({super.key});

  @override
  State<StatefulWidget> createState() => PieChart1State();
}

class PieChart1State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 300,
      child: Row(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.2,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    //상호작용세부정보
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 3, //각 섹션별 gap
                  centerSpaceRadius: 100, //중심원크기
                  centerSpaceColor: Colors.black, //중심원 색상
                  sections: showingSections(), //파이차트에 표시될 목록
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Indicator(
                color: Color(0xff0293ee),
                text: 'First',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xfff8b250),
                text: 'Second',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff845bef),
                text: 'Third',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff13d38e),
                text: 'Fourth',
                isSquare: true,
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      //List.generate : List item의 갯수를 만들고 각 인덱스에 대해 값을 채우는 함수
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 30.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee), //섹션색상
            value: 40, //섹션값
            showTitle: false,
            radius: radius, //너비 반경
            badgeWidget: isTouched
                ? Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("hello, I'm cheri"),
                              );
                            },
                          );
                        },
                        child: Text('hello!')))
                : SizedBox.shrink(),
            // badgePositionPercentageOffset: 2
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            showTitle: false,
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            showTitle: false,
            radius: radius,
          );

        default:
          return PieChartSectionData(
            color: Color.fromRGBO(230, 230, 230, 100),
            value: 35,
            showTitle: false,
            radius: radius,
          );
          ;
      }
    });
  }
}
