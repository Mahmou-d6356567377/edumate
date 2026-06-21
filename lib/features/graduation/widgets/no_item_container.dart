
import 'package:edumate/features/courses/widgets/themed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoItemContainer extends StatelessWidget {
  const NoItemContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.people_outline,
            color: Colors.grey,
            size: 32,
          ),
          SizedBox(height: 8),
          Text(
            'No Elements yet',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
