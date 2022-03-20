import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_flutter/providers/education.dart';
import 'package:resume_builder_flutter/screens/experience_screen.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);
  static const routeName = '/add-education';

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _collegeTEC = TextEditingController();
    late TextEditingController _universityTEC = TextEditingController();
    late TextEditingController _courseTEC = TextEditingController();
    late TextEditingController _gradeTEC = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    final educationData = Provider.of<Education>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Education'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'College Name',
                    icon: Icon(
                      Icons.school,
                    ),
                  ),
                  controller: _collegeTEC,
                  onChanged: (value) {
                    _collegeTEC.text = value;
                  },
                  validator: (val) => val!.length == 0
                      ? 'Empty name'
                      : val.length < 2
                          ? 'Invalid name'
                          : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'University Name',
                    icon: Icon(
                      Icons.school,
                    ),
                  ),
                  controller: _universityTEC,
                  onChanged: (value) {
                    _universityTEC.text = value;
                  },
                  validator: (val) => val!.length == 0
                      ? 'Empty name'
                      : val.length < 2
                          ? 'Invalid name'
                          : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Cousre',
                    icon: Icon(
                      Icons.school,
                    ),
                  ),
                  controller: _courseTEC,
                  onChanged: (value) {
                    _courseTEC.text = value;
                  },
                  validator: (val) => val!.length == 0
                      ? 'Empty course'
                      : val.length < 2
                          ? 'Invalid course'
                          : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Grade',
                    icon: Icon(Icons.grade),
                  ),
                  controller: _gradeTEC,
                  onChanged: (value) {
                    _gradeTEC.text = value;
                  },
                  validator: (val) => val!.length == 0 ? 'Empty Grade' : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      educationData.addEducationDetails(
                        _collegeTEC.text,
                        _universityTEC.text,
                        _courseTEC.text,
                        _gradeTEC.text,
                      );
                      Navigator.of(context)
                          .pushNamed(ExperienceScreen.routeNmae);
                    }
                  },
                  child: Text('Add Education'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
