
import 'package:flutter/material.dart';

class TabSwitcher extends StatelessWidget {
  const TabSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Project Teams',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Center(child: Text('Supervisor')),
          ),
        ],
      ),
    );
  }
}