import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_flutter/providers/project.dart';
import 'package:resume_builder_flutter/screens/preview_screen.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);
  static const routeName = '/project';

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleTEC = TextEditingController();
  TextEditingController _guideTEC = TextEditingController();
  TextEditingController _durationTEC = TextEditingController();
  TextEditingController _detailTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final projectData = Provider.of<Project>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Project'),
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
                  textDirection: TextDirection.ltr,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    icon: Icon(
                      Icons.location_city,
                    ),
                  ),
                  controller: _titleTEC,
                  onSaved: (value) {
                    _titleTEC.text = value!;
                  },
                  validator: (val) => val!.length == 0
                      ? 'Empty title'
                      : val.length < 2
                          ? 'Invalid title'
                          : null,
                ),
                TextFormField(
                  textDirection: TextDirection.ltr,
                  decoration: const InputDecoration(
                    labelText: 'Guide Name',
                    icon: Icon(
                      Icons.location_city,
                    ),
                  ),
                  controller: _guideTEC,
                  onSaved: (value) {
                    _guideTEC.text = value!;
                  },
                  validator: (val) => val!.length == 0
                      ? 'Empty Name'
                      : val.length < 2
                          ? 'Invalid name'
                          : null,
                ),
                TextFormField(
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Duration (in months)',
                    icon: Icon(
                      Icons.location_city,
                    ),
                  ),
                  controller: _durationTEC,
                  onSaved: (value) {
                    _durationTEC.text = value!;
                  },
                  validator: (val) =>
                      val!.length == 0 ? 'Empty Duration' : null,
                ),
                TextFormField(
                  textDirection: TextDirection.ltr,
                  maxLength: 100,
                  decoration: const InputDecoration(
                    labelText: 'Details',
                    icon: Icon(
                      Icons.location_city,
                    ),
                  ),
                  controller: _detailTEC,
                  onSaved: (value) {
                    _detailTEC.text = value!;
                  },
                  validator: (val) => val!.length == 0
                      ? 'Empty Details'
                      : val.length < 2
                          ? 'Invalid Details'
                          : null,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      projectData.addPerson(
                        _titleTEC.text,
                        _guideTEC.text,
                        _detailTEC.text,
                        _durationTEC.text,
                      );
                      Navigator.of(context).pushNamed(PreviewScreen.routeName);
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
