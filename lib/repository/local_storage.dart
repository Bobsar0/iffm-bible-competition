import 'dart:convert';

import 'package:bible_competition/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../models/model.dart';

class LocalStorage<T extends Model> extends Repository<T> {
  // SharedPreferences prefs;
  final uuid = const Uuid();
  final String storageKey;

  LocalStorage(this.storageKey);

  @override
  Future<T> create(T item) async {
    item.id = uuid.v1();
    await update(item);
    return item;
  }

  @override
  Future<T?> get(int id) async {
    final Map<String, T> participants = await _getItemsFromCache();
    return participants[id];
  }

  @override
  Future<List<T>> getAll() async {
    Map<String, T> items = await _getItemsFromCache();
    return items.values.toList(growable: false);
  }

  @override
  Future<void> update(T item) async {
    Map<String, T> items = await _getItemsFromCache();
    items[item.id!] = item;
    await _updateCache(items);
  }

  @override
  Future<void> delete(T item) async {
    Map<String, T> items = await _getItemsFromCache();
    items.remove(item.id);
    await _updateCache(items);
  }

  @override
  void clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(storageKey);
  }

  Future<Map<String, T>> _getItemsFromCache() async {
    final prefs = await SharedPreferences.getInstance();

    String? result = prefs.getString(storageKey);
    if (result == null) {
      return <String, T>{};
    }
    Map<String, T> cacheItems = jsonDecode(result);
    print('decoded: $cacheItems');
    return cacheItems;
  }

  Future<void> _updateCache(Map<String, T> items) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonStr = jsonEncode(items);
    print('participant jsonStr: $jsonStr');
    await prefs.setString(storageKey, jsonStr);
  }
}
