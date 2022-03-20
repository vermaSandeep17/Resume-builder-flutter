import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_flutter/providers/exprience.dart';
import 'package:resume_builder_flutter/screens/experience_screen.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final experienceData = Provider.of<Experience>(context);
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
                  'Experience',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ExperienceScreen.routeNmae);
                  },
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            CardItem(experienceData: experienceData.listPerson[0].name),
            CardItem(experienceData: experienceData.listPerson[0].url),
            CardItem(experienceData: experienceData.listPerson[0].designation),
            CardItem(experienceData: experienceData.listPerson[0].jobRole),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.experienceData,
  }) : super(key: key);

  final String experienceData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        experienceData,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
