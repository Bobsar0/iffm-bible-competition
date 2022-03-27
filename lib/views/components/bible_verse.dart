import 'package:bible_competition/controllers/participant_controller.dart';
import 'package:bible_competition/views/styles/button_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../controllers/competition_controller.dart';
import '../styles/html_style.dart';

class BibleVerse extends StatelessWidget {
  const BibleVerse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.watch<CompetitionController>().passage.reference ?? '',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Html(
          data: context.watch<CompetitionController>().passage.content ??
              'Bible passage not found. Please verify manually.',
          style: htmlStyle,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  context
                      .read<ParticipantController>()
                      .eliminateParticipant(context);
                  context.read<CompetitionController>().resetTimer();
                },
                child: const Text('Wrong'),
                style: elevatedButtonStyle(color: Colors.red)),
            ElevatedButton(
                onPressed: () =>
                    context.read<CompetitionController>().resetTimer(),
                child: const Text(
                  'Reset',
                  style: TextStyle(color: Colors.green),
                ),
                style: elevatedButtonStyle(color: Colors.white)),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<ParticipantController>()
                      .advanceParticipant(context);
                  context.read<CompetitionController>().resetTimer();
                },
                child: const Text('Correct'),
                style: elevatedButtonStyle()),
          ],
        )
      ],
    );
  }
}
