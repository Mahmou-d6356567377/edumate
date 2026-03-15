import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/features/home/widgets/daily_schedule_item.dart' show DailyScheduleItem;
import 'package:flutter/material.dart';

class DailySchedulePage extends StatelessWidget {
  const DailySchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          focusColor: Colors.black,
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff3572EF),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Daily Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: ListView.builder(itemBuilder: (context, index) => DailyScheduleItem(),itemCount: 10,),
      ),

    );
  }
}