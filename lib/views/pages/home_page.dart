import 'package:bible_competition/controllers/participant_controller.dart';
import 'package:bible_competition/views/pages/competition_page/competition_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/all_participants_widget.dart';
import '../styles/button_styles.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ParticipantController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('IFFM Word of God Competition'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('New Participant:'),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller:
                          context.read<ParticipantController>().nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter participant name',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () async => await context
                          .read<ParticipantController>()
                          .createParticipant(),
                      child: const Text('Add'))
                ],
              ),
              const Expanded(child: AllParticipantsWidget()),
              ElevatedButton(
                  onPressed: controller.allParticipants.isEmpty
                      ? null
                      : () async {
                          await context
                              .read<ParticipantController>()
                              .initActiveParticipantList();
                          Navigator.pushNamed(
                              context, CompetitionPage.routeName);
                        },
                  style: elevatedButtonStyle(),
                  child: const Text('Start Competition'))
            ],
          ),
        ),
      ),
    );
  }
}
