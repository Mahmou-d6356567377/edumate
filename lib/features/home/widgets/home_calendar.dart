import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeCalendar extends StatefulWidget {
  const HomeCalendar({super.key});

  @override
  State<HomeCalendar> createState() => _HomeCalendarState();
}

class _HomeCalendarState extends State<HomeCalendar> {
    DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TableCalendar(
      
      
        headerStyle: HeaderStyle(
          titleTextStyle: Fonts.headingStyle,
          
          //TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          formatButtonVisible: true,
          formatButtonDecoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          leftChevronIcon: Icon(Icons.arrow_back_ios_rounded, size: 15),
          rightChevronIcon: Icon(Icons.arrow_forward_ios_rounded, size: 15),
        ),
         calendarStyle: CalendarStyle(
          defaultTextStyle: Fonts.boldblackstyle16,
          todayDecoration: BoxDecoration(
            color: Color(ConstsColors.kblue),
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.orangeAccent,
            shape: BoxShape.circle,
          ),
        ),
      
      
      
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update `_focusedDay` here as well
          });
        },
      
        calendarFormat: _calendarFormat,
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
      ),
    );
  }
}
