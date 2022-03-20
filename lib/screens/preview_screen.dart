import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_flutter/widgets/education_details.dart';
import 'package:resume_builder_flutter/widgets/experience_details.dart';
import 'package:resume_builder_flutter/widgets/project_details.dart';

import '../providers/person.dart';
import '../widgets/personal_details.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({Key? key}) : super(key: key);
  static const routeName = '/preview-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Resume'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              PersonalCard(),
              EducationCard(),
              ExperienceCard(),
              ProjectCard(),
            ],
          ),
        ),
      ),
    );
  }
}
