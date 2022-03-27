import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/participant_controller.dart';
import '../../../../models/participant.dart';
import 'eliminated_competitors.dart';

class CompetitorsWidget extends StatelessWidget {
  const CompetitorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParticipantController controller = context.watch<ParticipantController>();
    List<Participant> activeParticipants =
        controller.activeParticipants.toList();

    return activeParticipants.isEmpty
        ? const Center(
            child: Text(
                'No Participants found. Add Participants to begin competition'))
        : SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    itemCount: activeParticipants.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${index + 1}. ${activeParticipants[index].name}',
                                style: const TextStyle(fontSize: 14),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2),
                            Visibility(
                                visible:
                                    index == controller.activeParticipantIdx,
                                child: const Icon(Icons.check_circle,
                                    color: Colors.green))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
                const SizedBox(height: 10),
                const Card(child: EliminatedParticipants()),
              ],
            ),
          );
  }
}
