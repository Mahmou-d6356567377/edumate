import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

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
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,

        // ✅ Header
        headerStyle: HeaderStyle(
          titleTextStyle: Fonts.headingStyle,
          formatButtonVisible: true,
          formatButtonDecoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          leftChevronIcon:
              const Icon(Icons.arrow_back_ios_rounded, size: 15),
          rightChevronIcon:
              const Icon(Icons.arrow_forward_ios_rounded, size: 15),
        ),

        // ✅ Calendar style
        calendarStyle: CalendarStyle(
          defaultTextStyle: Fonts.boldblackstyle16,
          todayDecoration: BoxDecoration(
            color: Color(ConstsColors.kblue),
            shape: BoxShape.circle,
          ),
          selectedDecoration: const BoxDecoration(
            color: Colors.orangeAccent,
            shape: BoxShape.circle,
          ),
        ),

        // ✅ Fix spacing issue
        rowHeight: 55,
        daysOfWeekHeight: 35,

        // ✅ FULL CONTROL over weekdays (padding + margin)
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            final text = DateFormat.E().format(day); // Sun, Mon...

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white, // change if needed
              ),
              child: Text(
                text,
                style: Fonts.boldblackstyle16
              ),
            );
          },
        ),

        // ✅ Selection logic
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },

        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },

        // ✅ Format control
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