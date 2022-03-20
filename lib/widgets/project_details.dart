import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_flutter/providers/project.dart';
import 'package:resume_builder_flutter/screens/project_screen.dart';

import '../providers/person.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projecData = Provider.of<Project>(context);
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Project',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ProjectScreen.routeName);
                  },
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            CardItem(personData: projecData.listPerson[0].title),
            CardItem(personData: projecData.listPerson[0].guide),
            CardItem(personData: projecData.listPerson[0].duration),
            CardItem(personData: projecData.listPerson[0].details)
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.personData,
  }) : super(key: key);

  final String personData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        personData,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
