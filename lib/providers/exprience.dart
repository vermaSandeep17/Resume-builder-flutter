import 'package:flutter/cupertino.dart';

class ExperienceDetail {
  final String name;
  final String designation;
  final String url;
  final String jobRole;

  ExperienceDetail({
    required this.name,
    required this.designation,
    required this.url,
    required this.jobRole,
  });
}

class Experience with ChangeNotifier {
  final List<ExperienceDetail> _list = [];

  List<ExperienceDetail> get listPerson {
    return [..._list];
  }

  void addExperience(String name, String design, String url, String jobRole) {
    _list.add(ExperienceDetail(
      name: name,
      designation: design,
      url: url,
      jobRole: jobRole,
    ));
    notifyListeners();
  }
}
