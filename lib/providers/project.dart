import 'package:flutter/cupertino.dart';

class ProjectItem {
  final String title;
  final String guide;
  final String duration;
  final String details;

  ProjectItem({
    required this.title,
    required this.guide,
    required this.duration,
    required this.details,
  });
}

class Project with ChangeNotifier {
  final List<ProjectItem> _list = [];

  List<ProjectItem> get listPerson {
    return [..._list];
  }

  void addPerson(String title, String guide, String details, String duration) {
    _list.add(ProjectItem(
      title: title,
      guide: guide,
      duration: duration,
      details: details,
    ));
    notifyListeners();
  }
}
