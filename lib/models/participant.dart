import 'package:bible_competition/models/community.dart';

import 'model.dart';

class Participant extends Model {
  String? name;
  String? username;
  bool? isEliminated;
  Community? community;

  Participant(
      {String id = '',
      required this.name,
      this.username,
      this.isEliminated = false,
      this.community})
      : super(id: id);

  Participant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    isEliminated = json['isEliminated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['isEliminated'] = isEliminated;
    // data['community'] = community;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
