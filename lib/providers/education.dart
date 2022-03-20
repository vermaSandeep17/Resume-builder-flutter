import 'package:flutter/cupertino.dart';

class EducationDetails {
  final String college;
  final String university;
  final String course;
  final String grade;

  EducationDetails({
    required this.college,
    required this.university,
    required this.course,
    required this.grade,
  });
}

class Education with ChangeNotifier {
  final List<EducationDetails> _list = [];

  List<EducationDetails> get list {
    return [..._list];
  }

  void addEducationDetails(
      String college, String university, String course, String grade) {
    _list.add(
      EducationDetails(
          college: college,
          university: university,
          course: course,
          grade: grade),
    );
    notifyListeners();
  }
}
