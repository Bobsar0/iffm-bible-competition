class Model {
  String? id;
  DateTime? createdAt;
  DateTime? lastUpdatedAt;
  Model({
    this.id,
  }) {
    createdAt = DateTime.now();
    lastUpdatedAt = DateTime.now();
  }
}
