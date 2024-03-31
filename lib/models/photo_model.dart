import 'dart:convert';

import 'user_model.dart';

class PhotoModel {
  final String id;
  final String path;
  final String type;
  final UserModel user;
  final DateTime? created;

  PhotoModel({
    required this.id,
    required this.path,
    required this.type,
    required this.user,
    this.created,
  });

  factory PhotoModel.fromMap(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['_id'],
      path: json['path'],
      type: json['type'],
      user: UserModel.fromMap(json['user']),
      created: DateTime.tryParse(json['created']),
    );
  }

  Map<String, dynamic> get toMap => {
        'path': path,
        'type': type,
        'user': user.toMap,
        'created': created?.toIso8601String(),
      };

  @override
  String toString() => jsonEncode(toMap);
}
