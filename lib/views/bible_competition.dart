import 'package:bible_competition/views/pages/competition_page/competition_page.dart';
import 'package:bible_competition/views/pages/home_page.dart';
import 'package:flutter/material.dart';

class BibleCompetition extends StatelessWidget {
  const BibleCompetition({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word of God competition',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(title: 'Home Page'),
        CompetitionPage.routeName: (context) => const CompetitionPage()
      },
    );
  }
}
