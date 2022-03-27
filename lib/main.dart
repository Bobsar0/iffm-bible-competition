import 'package:bible_competition/controllers/competition_controller.dart';
import 'package:bible_competition/controllers/participant_controller.dart';
import 'package:bible_competition/views/bible_competition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ParticipantController()),
    ChangeNotifierProvider(create: (_) => CompetitionController()),
  ], child: const BibleCompetition()));
}
