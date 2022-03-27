import 'package:bible_competition/models/participant.dart';
import 'package:bible_competition/services/participant_services/participant_services.dart';
import 'package:bible_competition/services/utils/logger_service.dart';
import 'package:bible_competition/views/components/custom_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ParticipantController with ChangeNotifier, DiagnosticableTreeMixin {
  final TextEditingController nameController = TextEditingController();
  final ParticipantServices services = ParticipantServices();
  int activeParticipantIdx = 0;
  int winningCriteria = 3;

  List<Participant> allParticipants = [];

  Participant? _activeParticipant;
  Set<Participant> activeParticipants = {};
  Set<Participant> eliminatedParticipants = {};

  Future<List<Participant>> getAllParticipants() async {
    allParticipants = await services.getAllParticipants();
    notifyListeners();
    return allParticipants;
  }

  Participant? get activeParticipant {
    _activeParticipant = activeParticipants.isEmpty
        ? null
        : activeParticipants.toList()[activeParticipantIdx];
    // notifyListeners();
    return _activeParticipant;
  }

  Future<void> initActiveParticipantList() async {
    List<Participant> participants = await getAllParticipants();
    activeParticipants = participants.toSet();
  }

  void updateActiveParticipantIdx() {
    activeParticipantIdx++;

    if (activeParticipantIdx >= activeParticipants.length) {
      activeParticipantIdx = 0;
    }
    notifyListeners();
  }

  // Eliminate from competition.
  // This doesn't remove from overall list in case participant needs to be added back
  void eliminateParticipant(BuildContext context) {
    if (_activeParticipant == null) {
      return;
    }
    _activeParticipant!.isEliminated = true;

    activeParticipants.remove(_activeParticipant);
    eliminatedParticipants.add(_activeParticipant!);

    // if idx is at bottom of active list, set to 0 to avoid range error
    if (activeParticipantIdx >= activeParticipants.length) {
      activeParticipantIdx = 0;
    }
    notifyListeners();
    checkForWinningCriteria(context);
  }

  void recoverParticipant(Participant participant) {
    eliminatedParticipants.remove(participant);
    activeParticipants.add(participant);
    notifyListeners();
  }

  void advanceParticipant(BuildContext context) {
    updateActiveParticipantIdx();
    checkForWinningCriteria(context);
  }

  void checkForWinningCriteria(BuildContext context) {
    if (activeParticipants.length == winningCriteria &&
        activeParticipantIdx == 0) {
      String names = activeParticipants.map((e) => e.name).toList().join(', ');
      // concludeCompetition(context, names);
      ModalDialog(
        context: context,
        title: 'Congratulations!!!',
        message:
            'Congratulations to $names for making it to the next round! May God bless you all',
        actionBtnText: 'Finish Competition',
        onActionBtnPressed: () => Navigator.of(context).pop(),
      );
      Logger.logInformative('FINISHED!!! $names');
    }
  }

  Future<bool> createParticipant() async {
    try {
      if (nameController.text.trim().isEmpty) return false;
      await services.createParticipant(nameController.text.trim());
      return true;
    } catch (e) {
      Logger.logCritical('Error in adding participant: $e');
      return false;
    } finally {
      notifyListeners();
      nameController.clear();
    }
  }

  correctAnswer() {
    // update current participant's list of verses
    // update curr participant rank
    // move to next participant
  }

  /// delete a participant
  void removeParticipant(Participant participant) {
    print('before rem: ${activeParticipants.length}');
    services.delete(participant);
    print('removed: rem: ${activeParticipants.length}');
    notifyListeners();
  }

  /// Makes `Participant` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(IntProperty('count', nameController));
  }
}

// List.unmodifiable(services.getAllParticipants());

// List<Participant> get allParticipants => [
//       Participant(name: 'Steve'),
//       Participant(name: 'Chima'),
//       Participant(name: 'Ugo Michael'),
//       Participant(name: 'Mike Godson'),
//     ];

// {
//   Participant(name: 'Steve'),
//   Participant(name: 'Chima'),
//   Participant(name: 'Ugo Michael'),
//   Participant(name: 'Mike Godson'),
// };
