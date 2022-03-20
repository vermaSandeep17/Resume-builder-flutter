import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_flutter/providers/person.dart';
import 'package:resume_builder_flutter/screens/education_screen.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);
  static const routeName = '/personalDetail';

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    late TextEditingController _nameTEC = TextEditingController();
    late TextEditingController _designationTEC = TextEditingController();
    late TextEditingController _cityTEC = TextEditingController();

    final personData = Provider.of<Person>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Detail'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    icon: Icon(
                      Icons.person,
                    ),
                  ),
                  controller: _nameTEC,
                  onSaved: (value) {
                    _nameTEC.text = value!;
                  },
                  validator: (val) => val!.length == 0
                      ? 'Empty name'
                      : val.length < 2
                          ? 'Invalid name'
                          : null,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Designation',
                    icon: Icon(
                      Icons.work,
                    ),
                  ),
                  controller: _designationTEC,
                  onSaved: (value) {
                    _designationTEC.text = value!;
                  },
                  validator: (val) => val!.length == 0
                      ? 'Empty Designation'
                      : val.length < 2
                          ? 'Invalid name'
                          : null,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textDirection: TextDirection.ltr,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    icon: Icon(
                      Icons.location_city,
                    ),
                  ),
                  controller: _cityTEC,
                  onSaved: (value) {
                    _cityTEC.text = value!;
                  },
                  validator: (val) => val!.length == 0
                      ? 'Empty City'
                      : val.length < 2
                          ? 'Invalid name'
                          : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      personData.addPerson(
                        _nameTEC.text,
                        _designationTEC.text,
                        _cityTEC.text,
                      );
                      Navigator.of(context)
                          .pushNamed(EducationScreen.routeName);
                    }
                  },
                  child: const Text('Add'),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
