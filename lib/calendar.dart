import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now(); //이 일자를 기준으로 캘린더에 일자가 표시된다.
  DateTime _selectedDay = DateTime.now(); //유저가 선택한 일자

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });
  }

  void _onHorizontalSwipe(SwipeDirection direction) {
    //가로 스와이프시 캘린더 변경
    setState(() {
      switch (direction) {
        case SwipeDirection.left:
          _focusedDay = DateUtils.addDaysToDate(_focusedDay, 14);
          break;
        case SwipeDirection.right:
          _focusedDay = DateUtils.addDaysToDate(_focusedDay, -14);
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleGestureDetector(
        onHorizontalSwipe: _onHorizontalSwipe,
        child: TableCalendar(
          //range는 항상 선택된 일부터 2주가 된다.
          rangeStartDay: _selectedDay,
          rangeEndDay: DateUtils.addDaysToDate(_selectedDay, 13),
          //
          locale: 'ko_KO',
          headerStyle: HeaderStyle(
            titleCentered: true, //년월표기일 중앙위치여부
            formatButtonVisible: false, // month or 2week or week format button
          ),
          firstDay: DateTime(0000, 00, 00), //이 날짜부터 캘린더에 표시된다.
          lastDay: DateTime(9999, 99, 99), //이 날짜까지 캘린더에 표시된다.
          focusedDay: _focusedDay, //현재 캘린더에 표시되어야할 일자들의 기준
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: CalendarFormat.twoWeeks, //캘린더 2주 형식으로 고정
          rangeSelectionMode: RangeSelectionMode.disabled, //range 선택 off
          startingDayOfWeek: StartingDayOfWeek.monday, //월요일이 한 주의 시작
          onDaySelected: _onDaySelected, //날짜 선택 이벤트함수
          onPageChanged: (focusedDay) {
            //페이지변경버튼 이벤트함수
            _focusedDay = focusedDay;
          },
        ));
  }
}
