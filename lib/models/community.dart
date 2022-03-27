import 'package:bible_competition/models/participant.dart';
import 'package:bible_competition/repository/repository.dart';

class Community {
  final String officialName;
  final String localName;
  final List<Participant> participants;
  final Repository<Participant> repository;

  Community(
      this.officialName, this.localName, this.participants, this.repository);
}
