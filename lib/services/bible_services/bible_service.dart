import 'dart:convert';

import 'package:bible_competition/models/passage.dart';
import 'package:bible_competition/services/bible_services/all_translations.dart';
import 'package:bible_competition/services/bible_services/networking/bible_network_service.dart';
import 'package:bible_competition/services/exceptions/network_exception.dart';

import '../../models/bible.dart';

class BibleService {
  final BibleNetworkService _networkService = BibleNetworkService();

  Future<List<Bible>> getAllTranslations() async {
    try {
      // final String response = await _networkService.fetchAllTranslations();
      // final Map<String, dynamic> json = jsonDecode(response);
      List<Bible> bibles =
          List<Bible>.from(bibleTranslations.map((x) => Bible.fromJson(x)));
      return bibles;
    } on NetworkException {
      rethrow;
    }
  }

  Future<List<Passage>> getBiblePassage(String id, String quotation) async {
    try {
      final String response =
          await _networkService.searchBiblePassage(id, quotation);
      final Map<String, dynamic> json = jsonDecode(response);
      print('bible passage json: $json');
      List<Passage> passages = json['data']['passages'] == null
          ? []
          : List<Passage>.from(
              json['data']['passages'].map((x) => Passage.fromJson(x)));
      return passages;
    } on NetworkException {
      rethrow;
    }
  }
}
