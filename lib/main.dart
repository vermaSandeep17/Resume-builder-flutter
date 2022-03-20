import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_flutter/providers/education.dart';
import 'package:resume_builder_flutter/providers/exprience.dart';
import 'package:resume_builder_flutter/providers/person.dart';
import 'package:resume_builder_flutter/providers/project.dart';
import 'package:resume_builder_flutter/screens/education_screen.dart';
import 'package:resume_builder_flutter/screens/experience_screen.dart';
import 'package:resume_builder_flutter/screens/home_screen.dart';
import 'package:resume_builder_flutter/screens/person_screen.dart';
import 'package:resume_builder_flutter/screens/preview_screen.dart';
import 'package:resume_builder_flutter/screens/project_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Person(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Education(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Experience(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Project(),
        ),
      ],
      child: MaterialApp(
        title: 'Resume Buider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        routes: {
          PersonScreen.routeName: (ctx) => const PersonScreen(),
          EducationScreen.routeName: (ctx) => const EducationScreen(),
          ExperienceScreen.routeNmae: (ctx) => const ExperienceScreen(),
          PreviewScreen.routeName: (ctx) => const PreviewScreen(),
          ProjectScreen.routeName: (ctx) => const ProjectScreen(),
        },
      ),
    );
  }
}
