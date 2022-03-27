// import 'dart:convert';
//
// import 'package:bible_competition/repository/repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uuid/uuid.dart';
//
// import '../../models/model.dart';
// import '../../models/participant.dart';
//
// class ParticipantCacheService<T extends Model> extends Repository<T> {
//
//   late SharedPreferences prefs;
//   final uuid = const Uuid();
//   final String storageKey;
//
//   ParticipantCacheService(this.storageKey) {
//     SharedPreferences.getInstance().then((instance) => prefs = instance)
//   }
//
//   @override
//   Future<void> create(T item) async {
//     item.id = uuid.v1();
//
//     Map<String, T> allParticipants = getAll();
//     allParticipants[item.id] = item;
//     String jsonStr = jsonEncode(allParticipants);
//     print('participant jsonStr: $jsonStr');
//     // List<String> allParticipantsStr = List<String>.from(allParticipants.map((e) => e.))
//     await prefs.setString(storageKey, jsonStr);
//   }
//
//
//   @override
//   get(int id) {
//     final Map<String,T> participants = getAll();
//     return participants[id];
//   }
//
//   @override
//   Map<String, T> getAll() {
//     String? result = prefs.getString(storageKey);
//     if(result == null) {
//       return <String, T>{};
//     }
//     Map<String, T> participants = jsonDecode(result);
//
//     return participants;
//   }
//
//
//   @override
//   void update(item) {
//     Map<String, T> allParticipants = getAll();
//     allParticipants[item.id] = item;
//   }
//
//   @override
//   void delete(item) {
//     Map<String, T> allParticipants = getAll();
//     allParticipants.remove(item.id);
//   }
//
//   @override
//   void clear() {
//     prefs.remove(storageKey);
//   }
//
// }
