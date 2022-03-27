import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/participant_controller.dart';
import '../../../../models/participant.dart';
import '../../../components/custom_alert_dialog.dart';

class EliminatedParticipants extends StatelessWidget {
  const EliminatedParticipants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Participant> eliminatedParticipants =
        context.watch<ParticipantController>().eliminatedParticipants.toList();

    return eliminatedParticipants.length == 0
        ? Container()
        : Column(
            children: [
              const SizedBox(height: 10),
              const Text('Eliminated',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              ListView.separated(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: eliminatedParticipants.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(eliminatedParticipants[index].name!,
                            style: const TextStyle(
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          color: Colors.green,
                          onPressed: () {
                            ModalDialog(
                              context: context,
                              title: 'Confirm',
                              message:
                                  'Are you sure you want to bring back ${eliminatedParticipants[index].name}?',
                              actionBtnText: 'Yes',
                              cancelBtnText: 'Cancel',
                              onActionBtnPressed: () => context
                                  .read<ParticipantController>()
                                  .recoverParticipant(
                                      eliminatedParticipants[index]),
                            );
                          },
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ],
          );
  }
}
