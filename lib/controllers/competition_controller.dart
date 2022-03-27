import 'package:bible_competition/controllers/participant_controller.dart';
import 'package:bible_competition/models/bible.dart';
import 'package:bible_competition/services/bible_services/bible_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/passage.dart';

class CompetitionController with ChangeNotifier, DiagnosticableTreeMixin {
  List<Bible> availableBibles = [];
  final BibleService _service = BibleService();
  Bible? selectedBible;
  List<DropdownMenuItem<Bible>> dropdownItems = [];
  Passage passage = Passage();
  bool showPassage = false;
  Set<String> quotedPassages = {};
  bool? passageIsValid;

  final ParticipantController participantController = ParticipantController();

  bool get disableTimerBtn {
    bool shouldDisable = quotationController.text.isEmpty;
    notifyListeners();
    return shouldDisable;
  }

  void get notify => notifyListeners();

  TextEditingController quotationController = TextEditingController();

  CompetitionController() {
    getBibleTranslations();
  }

  Future<void> getBibleTranslations() async {
    availableBibles = await _service.getAllTranslations();
    selectedBible = availableBibles[0];
    dropdownItems = availableBibles.map<DropdownMenuItem<Bible>>((Bible bible) {
      return DropdownMenuItem<Bible>(
        value: bible,
        child: Text(bible.abbrev),
      );
    }).toList();
    notifyListeners();
  }

  void toggleShowPassage() {
    showPassage = !showPassage;
    notifyListeners();
  }

  Future<void> searchBiblePassage() async {
    if (quotationController.text.isEmpty || selectedBible?.id == null) {
      return;
    }
    List<Passage> passages = await _service.getBiblePassage(
        selectedBible!.id, quotationController.text);

    passage = passages[0];

    passageIsValid = quotedPassages.add(passage.id!);
    notify;
  }

  resetTimer() {
    passageIsValid = null;
    toggleShowPassage();
  }
}
