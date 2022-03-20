import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_flutter/providers/exprience.dart';
import 'package:resume_builder_flutter/screens/preview_screen.dart';
import 'package:resume_builder_flutter/screens/project_screen.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);
  static const routeNmae = '/experience-screen';

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _comanyNameTEC = TextEditingController();
  final TextEditingController _websiteTEC = TextEditingController();
  final TextEditingController _designationTEC = TextEditingController();
  final TextEditingController _jobDescTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final experienceData = Provider.of<Experience>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Company Name',
                    icon: Icon(
                      Icons.business,
                    ),
                  ),
                  controller: _comanyNameTEC,
                  onSaved: (value) {
                    _comanyNameTEC.text = value!;
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
                    labelText: 'Company Website',
                    icon: Icon(Icons.link),
                  ),
                  controller: _websiteTEC,
                  onSaved: (value) {
                    _websiteTEC.text = value!;
                  },
                  validator: (val) => val!.length == 0
                      ? 'Empty url'
                      : val.length < 2
                          ? 'Invalid url'
                          : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Designation',
                    icon: Icon(
                      Icons.person,
                    ),
                  ),
                  controller: _designationTEC,
                  onSaved: (value) {
                    _designationTEC.text = value!;
                  },
                  validator: (val) => val!.length == 0
                      ? 'Empty designation'
                      : val.length < 2
                          ? 'Invalid Designation'
                          : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Job Description',
                    icon: Icon(
                      Icons.details,
                    ),
                  ),
                  maxLength: 100,
                  controller: _jobDescTEC,
                  onSaved: (value) {
                    _jobDescTEC.text = value!;
                  },
                  validator: (val) => val!.length == 0
                      ? 'Empty Description'
                      : val.length < 2
                          ? 'Invalid Description'
                          : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      experienceData.addExperience(
                        _comanyNameTEC.text,
                        _designationTEC.text,
                        _websiteTEC.text,
                        _jobDescTEC.text,
                      );
                      Navigator.of(context).pushNamed(ProjectScreen.routeName);
                    }
                  },
                  child: Text('Add Experience'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
