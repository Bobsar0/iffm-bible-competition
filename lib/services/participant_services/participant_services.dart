import '../../models/participant.dart';
import '../../repository/in_memory_cache.dart';
import '../../repository/repository.dart';

class ParticipantServices {
  final Repository<Participant> _repository = InMemoryCache<Participant>();
  // final Repository<Participant> _repository =
  //     LocalStorage<Participant>('participants');

  Future<Participant> createParticipant(String name) async {
    String username = name.replaceAll(" ", "");

    final participant =
        await _repository.create(Participant(name: name, username: username));
    return Future.value(participant);
  }

  Future<List<Participant>> getAllParticipants() async {
    return await _repository.getAll();
  }

  // void saveParticipant(Participant participant) async {
  //   await _repository.update(participant);
  // }

  Future<void> delete(Participant participant) async {
    await _repository.delete(participant);
  }
}
