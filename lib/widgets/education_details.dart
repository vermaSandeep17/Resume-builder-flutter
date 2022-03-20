import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_flutter/providers/education.dart';
import 'package:resume_builder_flutter/screens/education_screen.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final educationData = Provider.of<Education>(context);
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
                  'Education',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(EducationScreen.routeName);
                  },
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            CardItem(educationData: educationData.list[0].college),
            CardItem(educationData: educationData.list[0].university),
            CardItem(educationData: educationData.list[0].course),
            CardItem(educationData: educationData.list[0].grade)
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.educationData,
  }) : super(key: key);

  final String educationData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Text(
        educationData,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
