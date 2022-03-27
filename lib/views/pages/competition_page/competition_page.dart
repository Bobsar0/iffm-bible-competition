import 'package:bible_competition/views/pages/competition_page/components/competitors_widget.dart';
import 'package:flutter/material.dart';

import '../../components/scripture_widget.dart';

class CompetitionPage extends StatelessWidget {
  static const String routeName = 'competition';

  const CompetitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Competition Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 2, child: CompetitorsWidget()),
            SizedBox(width: 20),
            Expanded(flex: 3, child: ScriptureWidget())
          ],
        ),
      ),
    );
  }
}
