import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:flutter/material.dart';

class SubjectMemberItem extends StatelessWidget {
  const SubjectMemberItem({super.key});

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
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
          ),
        ),
        title: Text('John Doe'),
        subtitle: Text('Instructor', style: TextStyle(color: Colors.green)),
      ),
    );
  }
}
