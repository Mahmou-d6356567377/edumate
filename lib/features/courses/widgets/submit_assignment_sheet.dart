import 'package:edumate/core/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubmitAssignmentSheet extends StatelessWidget {
  const SubmitAssignmentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _header(context),
              const SizedBox(height: 16),
              _uploadBox(),
              const SizedBox(height: 16),
              _selectedFile(),
              const SizedBox(height: 16),
              _commentField(),
              const SizedBox(height: 16),
              _privateComment(),
              const SizedBox(height: 20),
              _buttonsRow(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _header(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "Submit Assignment",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
    ],
  );
}

Widget _uploadBox() {
  return Container(
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue.shade200, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(12),
      color: Colors.blue.shade50,
    ),
    child: Column(
      children: [
        const Icon(Icons.cloud_upload_outlined, size: 40, color: Colors.blue),
        const SizedBox(height: 8),
        const Text(
          "Drag and drop file here",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        const Text(
          "Support PDF, DOCX up to 20MB",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        ElevatedButton(onPressed: () {}, child: const Text("Choose File")),
      ],
    ),
  );
}

Widget _commentField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Comments (Optional)",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 8),
      TextField(
        maxLines: 3,
        decoration: InputDecoration(
          hintText: "Add a note to your instructor...",
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ],
  );
}

Widget _privateComment() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text("Private Comment", style: TextStyle(fontWeight: FontWeight.w600)),
      SizedBox(height: 8),
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(child: Icon(Icons.person)),
        title: Text("Ali farag taha saad"),
        subtitle: Text("1h ago"),
      ),
    ],
  );
}

Widget _buttonsRow(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: ElevatedButton(
          onPressed: () {
            showAboutDialog(
              context: context,
              children: [ SvgPicture.asset(Constants.checkicon, width: 50, height: 50) ],
            );
          },
          child: const Text("Submit"),
        ),
      ),
    ],
  );
}

Widget _selectedFile() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Selected Files",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(Icons.picture_as_pdf, color: Colors.red),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Research_Final_V2.pdf"),
                  Text(
                    "2.4 MB",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
      ),
    ],
  );
}
