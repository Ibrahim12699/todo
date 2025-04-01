class StatusModel {
  final String id;
  final String title;

  int? count;

  StatusModel({required this.title, required this.id, this.count});
}
