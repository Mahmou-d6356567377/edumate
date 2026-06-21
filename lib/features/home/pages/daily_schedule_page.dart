import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/features/home/data/models/time_line_model/time_line_model.dart';
import 'package:edumate/features/home/widgets/daily_schedule_item.dart'
    show DailyScheduleItem;
import 'package:flutter/material.dart';

class DailySchedulePage extends StatelessWidget {
  const DailySchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          focusColor: Colors.black,
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff3572EF)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Daily Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: ListView.builder(
          itemBuilder:
              (context, index) => DailyScheduleItem(
                timeLineModel: TimeLineModel(
                  sessionId: '2fc2d373-894e-4da0-b742-cac5ba1e53e4',
                  imageUrl: '/images/8e49877b-2f83-4025-9e46-bb4a6637fa99.png',
                  courseName: 'intro to cs',
                  instructorName: 'Doc. Amr Hosny',
                  day: 'Sunday',
                  startTime: '09:00:00',
                  endTime: '11:00:00',
                  type: 'Lecture',
                  location: 'Hall 1',
                ),
              ),
          itemCount: 10,
        ),
      ),
    );
  }
}
