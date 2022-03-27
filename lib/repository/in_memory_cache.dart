import 'package:bible_competition/repository/repository.dart';

import '../models/model.dart';

class InMemoryCache<T extends Model> implements Repository<T> {
  // declare list of type T
  // late final List<T> _items;
  // static final InMemoryCache<Model> _singleton = InMemoryCache._internal();
  //
  // factory InMemoryCache() {
  //   return _singleton;
  // }
  //
  // InMemoryCache._internal();

  final Map<String, T> _storage = <String, T>{};
  int _lastKey = 0;

  @override
  Future<T> create(T item) async {
    final int id = _lastKey + 1;
    _lastKey = id;

    item.id = id.toString();
    _storage[id.toString()] = item;
    return item;
  }

  @override
  Future<T?> get(int id) {
    if (id >= _storage.length) {
      return Future.value(null);
    }
    return Future.value(_storage[id]);
  }

  /// Returns a fixed length list
  @override
  Future<List<T>> getAll() {
    return Future.value(_storage.values.toList(growable: false));
  }

  @override
  Future<void> update(T item) async {
    _storage[item.id!] = item;
  }

  @override
  Future<void> delete(T item) async {
    _storage.remove(item.id);
  }

  @override
  void clear() {
    _storage.clear();
  }

// InMemoryCache() {
//   _items = <T>[];
// }

// void addOne(T item) {
//   _items.add(item);
// }
//
// void addAll(List<T> newItems) {
//   _items.addAll(newItems);
// }
//
// T? getOne(int index) {
//   if (index >= _items.length) {
//     return null;
//   }
//   return _items[index];
// }
//
// int getTotalCount() {
//   return _items.length;
// }

}
