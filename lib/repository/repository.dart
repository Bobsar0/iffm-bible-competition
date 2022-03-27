import 'dart:core';

/// A Repository Generic class that stores objects of type {@code T}. This acts a layer of abstraction to the underlying class type used
///
/// A Generic class is used here so that the Repository class can be written once and used for any Object type {@code T} - without needing to create separate classes for them
/// @param <T> the class Type to store in this database object
abstract class Repository<T> {
  Future<T> create(T item);
  Future<T?> get(int id);
  Future<List<T>> getAll();
  Future<void> update(T item);
  Future<void> delete(T item);
  void clear();
}
