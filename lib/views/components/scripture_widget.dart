import 'package:bible_competition/controllers/competition_controller.dart';
import 'package:bible_competition/controllers/participant_controller.dart';
import 'package:bible_competition/views/components/bible_verse.dart';
import 'package:bible_competition/views/components/default_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/competition_page/components/quotation_search.dart';
import 'countdown_timer.dart';

class ScriptureWidget extends StatelessWidget {
  const ScriptureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CompetitionController>();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Current Participant:',
                  style: TextStyle(fontSize: 24)),
              const SizedBox(width: 10),
              Text(
                  context
                          .watch<ParticipantController>()
                          .activeParticipant
                          ?.name ??
                      'None',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          const DefaultSizedBox(),
          const QuotationSearchWidget(),
          const DefaultSizedBox(),
          Visibility(
              visible: !controller.showPassage, child: const CountdownTimer()),
          Visibility(
              visible: controller.showPassage, child: const BibleVerse()),
        ],
      ),
    );
  }
}
