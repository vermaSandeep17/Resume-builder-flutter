import 'package:flutter/cupertino.dart';

class SinglePerson {
  final String id;
  final String name;
  final String designation;
  final String city;

  SinglePerson({
    required this.id,
    required this.name,
    required this.designation,
    required this.city,
  });
}

class Person with ChangeNotifier {
  final List<SinglePerson> _list = [];

  List<SinglePerson> get listPerson {
    return [..._list];
  }

  void addPerson(String name, String design, String city) {
    _list.add(
      SinglePerson(
        id: DateTime.now().toString(),
        name: name,
        designation: design,
        city: city,
      ),
    );
    notifyListeners();
  }
}
