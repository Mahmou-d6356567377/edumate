import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:flutter/material.dart';

class SubjectMemberItem extends StatelessWidget {
  const SubjectMemberItem({
    super.key,
    required this.name,
    required this.role,
  });

  final String name;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          Theme.of(context).brightness == Brightness.light
              ? ConstContainerDecorations.whiteshadow(context)
              : ConstContainerDecorations.darkmodeshadow(context),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blueGrey,
          child: Text(
            name.isNotEmpty ? name[0].toUpperCase() : '?',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(name),
        subtitle: Text(role, style: TextStyle(color: Colors.green)),
      ),
    );
  }
}