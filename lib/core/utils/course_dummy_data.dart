// lib/features/courses/data/course_dummy_data.dart

class RecentFileModel {
  final String title;
  final String url;
  final String uploadedAt;

  const RecentFileModel({
    required this.title,
    required this.url,
    required this.uploadedAt,
  });
}

class MaterialFolderModel {
  final String title;
  final int fileCount;

  const MaterialFolderModel({required this.title, required this.fileCount});
}

class AssignmentModel {
  final String title;
  final String dueDate;
  final String category; // 'all' | 'upcoming' | 'missing' | 'completed'
  final String tag; // chip label shown on the right e.g. "All", "Chapter 3"

  const AssignmentModel({
    required this.title,
    required this.dueDate,
    required this.category,
    required this.tag,
  });
}

class CourseDummyData {
  // ── Recent Files (ClassWorkPage) ──────────────────────────────────────────
  static const List<RecentFileModel> recentFiles = [
    RecentFileModel(
      title: 'Lecture 1 – Introduction to IP',
      url: 'drive.google.com/lec1-intro',
      uploadedAt: 'Oct 1',
    ),
    RecentFileModel(
      title: 'Lecture 2 – Pixel Manipulation',
      url: 'drive.google.com/lec2-pixels',
      uploadedAt: 'Oct 4',
    ),
    RecentFileModel(
      title: 'Lab Sheet 1',
      url: 'classroom.example.com/lab1',
      uploadedAt: 'Oct 6',
    ),
    RecentFileModel(
      title: 'Midterm Study Guide',
      url: 'classroom.example.com/midterm-guide',
      uploadedAt: 'Oct 10',
    ),
    RecentFileModel(
      title: 'Lecture 3 – Histogram Equalization',
      url: 'drive.google.com/lec3-histogram',
      uploadedAt: 'Oct 12',
    ),
  ];

  // ── Material Folders (MaterialsPage grid) ────────────────────────────────
  static const List<MaterialFolderModel> materialFolders = [
    MaterialFolderModel(title: 'Lec 1 – Intro to IP',      fileCount: 3),
    MaterialFolderModel(title: 'Lec 2 – Pixel Ops',        fileCount: 2),
    MaterialFolderModel(title: 'Lec 3 – Histogram',        fileCount: 4),
    MaterialFolderModel(title: 'Lec 4 – Spatial Filters',  fileCount: 3),
    MaterialFolderModel(title: 'Lec 5 – Edge Detection',   fileCount: 2),
    MaterialFolderModel(title: 'Lec 6 – Morphology',       fileCount: 3),
    MaterialFolderModel(title: 'Lec 7 – Segmentation',     fileCount: 2),
    MaterialFolderModel(title: 'Lec 8 – Frequency Domain', fileCount: 4),
    MaterialFolderModel(title: 'Lab Sheets',               fileCount: 6),
    MaterialFolderModel(title: 'Past Papers',              fileCount: 5),
    MaterialFolderModel(title: 'Reference Books',          fileCount: 2),
    MaterialFolderModel(title: 'Midterm Resources',        fileCount: 7),
  ];

  // ── Assignments ───────────────────────────────────────────────────────────
  static const List<AssignmentModel> assignments = [
    // ---- upcoming ----
    AssignmentModel(
      title: 'Assignment 1: Pixel Brightness Adjustment',
      dueDate: 'Due: Oct 18, 11:59 PM',
      category: 'upcoming',
      tag: 'All',
    ),
    AssignmentModel(
      title: 'Lab Task 2: Apply Gaussian Filter',
      dueDate: 'Due: Oct 20, 11:59 PM',
      category: 'upcoming',
      tag: 'Lab',
    ),
    AssignmentModel(
      title: 'Assignment 2: Histogram Equalization',
      dueDate: 'Due: Oct 25, 11:59 PM',
      category: 'upcoming',
      tag: 'All',
    ),
    AssignmentModel(
      title: 'Research Summary: Edge Detection Methods',
      dueDate: 'Due: Oct 28, 11:59 PM',
      category: 'upcoming',
      tag: 'Report',
    ),
    // ---- missing ----
    AssignmentModel(
      title: 'Assignment 3: Sobel Edge Detection',
      dueDate: 'Was due: Oct 5, 11:59 PM',
      category: 'missing',
      tag: 'All',
    ),
    AssignmentModel(
      title: 'Lab Task 1: Grayscale Conversion',
      dueDate: 'Was due: Sep 28, 11:59 PM',
      category: 'missing',
      tag: 'Lab',
    ),
    // ---- completed ----
    AssignmentModel(
      title: 'Assignment 4: Create Database Schema',
      dueDate: 'Submitted: Oct 15, 10:32 AM',
      category: 'completed',
      tag: 'All',
    ),
    AssignmentModel(
      title: 'Lab Task 3: Morphological Operations',
      dueDate: 'Submitted: Oct 13, 9:00 PM',
      category: 'completed',
      tag: 'Lab',
    ),
    AssignmentModel(
      title: 'Assignment 5: Image Segmentation',
      dueDate: 'Submitted: Oct 10, 11:58 PM',
      category: 'completed',
      tag: 'All',
    ),
  ];

  /// Returns assignments filtered by chip index:
  /// 0 = All, 1 = Upcoming, 2 = Missing, 3 = Completed
  static List<AssignmentModel> assignmentsFor(int chipIndex) {
    switch (chipIndex) {
      case 1:
        return assignments.where((a) => a.category == 'upcoming').toList();
      case 2:
        return assignments.where((a) => a.category == 'missing').toList();
      case 3:
        return assignments.where((a) => a.category == 'completed').toList();
      default:
        return assignments; // All
    }
  }
}


// lib/features/home/data/notification_dummy_data.dart

class NotificationModel {
  final String title;
  final String courseName;
  final String body;
  final String time;

  const NotificationModel({
    required this.title,
    required this.courseName,
    required this.body,
    required this.time,
  });
}

const List<NotificationModel> dummyNotifications = [
  NotificationModel(
    title: 'New announcement',
    courseName: 'Advanced Mathematics',
    body: 'Final project submission link is now live.',
    time: '2 hrs ago',
  ),
  NotificationModel(
    title: 'Assignment due soon',
    courseName: 'Image Processing',
    body: 'Assignment 3: Edge Detection is due tomorrow at 11:59 PM.',
    time: '4 hrs ago',
  ),
  NotificationModel(
    title: 'New material uploaded',
    courseName: 'Database Systems',
    body: 'Lecture 7 – Normalization slides have been posted.',
    time: '6 hrs ago',
  ),
  NotificationModel(
    title: 'Grade released',
    courseName: 'Data Structures',
    body: 'Your midterm grade is now available. Check your results.',
    time: 'Yesterday',
  ),
  NotificationModel(
    title: 'Class cancelled',
    courseName: 'Operating Systems',
    body: "Today's lecture has been cancelled. Stay tuned for updates.",
    time: 'Yesterday',
  ),
  NotificationModel(
    title: 'New announcement',
    courseName: 'Software Engineering',
    body: 'Project teams have been finalized. Check the attached sheet.',
    time: '2 days ago',
  ),
  NotificationModel(
    title: 'Reminder',
    courseName: 'Computer Networks',
    body: 'Lab session this Friday is mandatory. Attendance will be taken.',
    time: '2 days ago',
  ),
  NotificationModel(
    title: 'New material uploaded',
    courseName: 'Advanced Mathematics',
    body: 'Practice problems for Chapter 5 are now available.',
    time: '3 days ago',
  ),
  NotificationModel(
    title: 'Assignment graded',
    courseName: 'Image Processing',
    body: 'Assignment 2 has been graded. You scored 18/20.',
    time: '3 days ago',
  ),
  NotificationModel(
    title: 'New announcement',
    courseName: 'Database Systems',
    body: 'Office hours this week are moved to Thursday 2–4 PM.',
    time: '4 days ago',
  ),
];