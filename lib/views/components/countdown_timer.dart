import 'dart:async';

import 'package:bible_competition/controllers/competition_controller.dart';
import 'package:bible_competition/views/components/custom_alert_dialog.dart';
import 'package:bible_competition/views/components/default_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  int _currCount = 3;

  Future<void> startTimer(BuildContext context) async {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_currCount == 0) {
          ModalDialog(
              context: context,
              message:
                  "Participant's time is up. Click button to reveal scripture verse",
              title: 'Time Up!',
              actionBtnText: 'Reveal Scripture content',
              onActionBtnPressed: () =>
                  context.read<CompetitionController>().toggleShowPassage()
              // onActionBtnPressed: () async => await context
              //     .read<CompetitionController>()
              //     .searchBiblePassage(),
              );

          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _currCount--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CompetitionController>();
    return Column(
      children: <Widget>[
        Visibility(
            visible: controller.passageIsValid != null,
            child: Column(
              children: [
                controller.passageIsValid == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Passage has not been quoted',
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          Icon(Icons.check, color: Colors.green),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Passage has been quoted!',
                              style: TextStyle(color: Colors.red)),
                          Icon(Icons.close, color: Colors.red),
                        ],
                      ),
                const DefaultSizedBox()
              ],
            )),
        ElevatedButton(
          onPressed: controller.quotationController.text.isEmpty ||
                  controller.passageIsValid != true
              ? null
              : () async => await startTimer(context),
          style: ElevatedButton.styleFrom(minimumSize: const Size(150, 50)),
          child: const Text("Start Timer", style: TextStyle(fontSize: 18)),
        ),
        const SizedBox(height: 10),
        Text(
          "$_currCount",
          style: TextStyle(
              fontSize: 200, color: _currCount > 3 ? Colors.black : Colors.red),
        )
      ],
    );
  }
}
