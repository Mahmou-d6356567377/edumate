import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/features/courses/widgets/assigment_list.dart';
import 'package:flutter/material.dart';

class AssignmentsPage extends StatefulWidget {
  const AssignmentsPage({super.key});

  @override
  State<AssignmentsPage> createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends State<AssignmentsPage> {

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height:70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ConstVariebles.choicechipsassignmentList.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChoiceChip(
                      label: Text(ConstVariebles.choicechipsassignmentList[index]),
                      selected: selected == index,
                      selectedColor: Color(ConstsColors.kblue),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selected == index ? Colors.white : Colors.grey,
                      ),
                      //  clipBehavior: Clip.antiAlias,
                      elevation: 5,
                      shadowColor: Colors.black,
                      side: const BorderSide(color: Colors.transparent),
                      onSelected: (value) {
                        setState(() {
                          selected = index;
                        });
                      },
                    ),
                  ),
            ),
          ),
        ),
        AssignmentList(height: height, selectedList: selected),
      ],
    );
  }
}
