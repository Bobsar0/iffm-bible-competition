import 'package:bible_competition/views/components/spinner_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/participant_controller.dart';
import '../../models/participant.dart';

class AllParticipantsWidget extends StatelessWidget {
  const AllParticipantsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParticipantController controller = context.watch<ParticipantController>();
    // Future<List<Participant>> participantsFuture = controller.getAllParticipants();

    return FutureBuilder<List<Participant>>(
        future: controller.getAllParticipants(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Participant>> snapshot) {
          List<Widget> children;
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          if (snapshot.hasData && snapshot.data != null) {
            final List<Participant> participants = snapshot.data!;
            return participants.isEmpty
                ? const Center(
                    child: Text(
                    'No participants. Add Participants to begin competition!',
                    style: TextStyle(fontSize: 20),
                  ))
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 0),
                        shrinkWrap: true,
                        itemCount: participants.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  participants[index].name!,
                                  style: TextStyle(fontSize: 16),
                                  // overflow: TextOverflow.ellipsis,
                                  // maxLines: 2,
                                ),
                              ),
                              IconButton(
                                  onPressed: () => context
                                      .read<ParticipantController>()
                                      .removeParticipant(participants[index]),
                                  icon: const Icon(
                                    Icons.clear_outlined,
                                    color: Colors.red,
                                    size: 20,
                                  ))
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ),
                    ),
                  );
          }
          return SpinnerWidget();
        });

    // return participants.isEmpty
    //     ? const Center(
    //         child: Text(
    //         'No participants. Add Participants to begin competition!',
    //         style: TextStyle(fontSize: 20),
    //       ))
    //     : Padding(
    //         padding: const EdgeInsets.all(20.0),
    //         child: Card(
    //           child: ListView.separated(
    //             padding:
    //                 const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
    //             shrinkWrap: true,
    //             itemCount: participants.length,
    //             itemBuilder: (BuildContext context, int index) {
    //               return Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 // crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: Text(
    //                       participants[index].name,
    //                       style: TextStyle(fontSize: 16),
    //                       // overflow: TextOverflow.ellipsis,
    //                       // maxLines: 2,
    //                     ),
    //                   ),
    //                   IconButton(
    //                       onPressed: () => context
    //                           .read<ParticipantController>()
    //                           .removeParticipant(participants[index]),
    //                       icon: const Icon(
    //                         Icons.clear_outlined,
    //                         color: Colors.red,
    //                         size: 20,
    //                       ))
    //                 ],
    //               );
    //             },
    //             separatorBuilder: (BuildContext context, int index) =>
    //                 const Divider(),
    //           ),
    //         ),
    //       );
  }
}
