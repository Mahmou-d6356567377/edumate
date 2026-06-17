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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,

        // ✅ Header
        headerStyle: HeaderStyle(
          titleTextStyle: Fonts.headingStyle.copyWith(
            color: isDark ? Colors.white : Colors.black,
          ),
          formatButtonVisible: true,
          formatButtonDecoration: BoxDecoration(
            color: isDark ? Color(ConstsColors.kdarkbluegray) : Colors.white,
            border: Border.all(
              color: isDark ? Colors.grey.shade700 : Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          formatButtonTextStyle: TextStyle(
            color: isDark ? Colors.white : Colors.black,
          ),
          leftChevronIcon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 15,
            color: isDark ? Colors.white : Colors.black,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),

        // ✅ Calendar style
        calendarStyle: CalendarStyle(
          defaultTextStyle: Fonts.boldblackstyle16.copyWith(
            color: isDark ? Colors.white : Colors.black,
          ),
          weekendTextStyle: Fonts.boldblackstyle16.copyWith(
            color: isDark ? Colors.white : Colors.black,
          ),
          outsideTextStyle: TextStyle(
            color: isDark ? Colors.white38 : Colors.grey.shade400,
          ),
          todayDecoration: BoxDecoration(
            color: Color(ConstsColors.kblue),
            shape: BoxShape.circle,
          ),
          selectedDecoration: const BoxDecoration(
            color: Colors.orangeAccent,
            shape: BoxShape.circle,
          ),
        ),

        rowHeight: 55,
        daysOfWeekHeight: 35,

        // ✅ Day-of-week row
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            final text = DateFormat.E().format(day);

            final referenceDay = _selectedDay ?? _focusedDay;
            final isSelectedWeekday = day.weekday == referenceDay.weekday;

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 6),
              alignment: Alignment.center,
              // 🔑 Removed white background — let the parent's
              // dark surface show through instead
              child: Text(
                text,
                style:
                    isSelectedWeekday
                        ? Fonts.normalbluestyle14
                        : Fonts.normalgreystyle14.copyWith(
                          color: isDark ? Colors.grey.shade400 : null,
                        ),
              ),
            );
          },
        ),

        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },

        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
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
