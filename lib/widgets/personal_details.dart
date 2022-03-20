import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_flutter/screens/person_screen.dart';

import '../providers/person.dart';

class PersonalCard extends StatelessWidget {
  const PersonalCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personData = Provider.of<Person>(context);
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
                  'Personal Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(PersonScreen.routeName);
                  },
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            CardItem(personData: personData.listPerson[0].name),
            CardItem(personData: personData.listPerson[0].designation),
            CardItem(personData: personData.listPerson[0].city),
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
