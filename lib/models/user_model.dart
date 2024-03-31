import 'dart:convert';

import 'advert_model.dart';

class UserModel {
  final DateTime? created;
  final DateTime? updated;
  final List<AdvertModel> adverts;
  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final List<Location> location;

  UserModel({
    this.created,
    this.updated,
    this.adverts = const [],
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.location = const [],
  });

  UserModel copyWith({
    DateTime? created,
    DateTime? updated,
    List<AdvertModel>? adverts,
    String? id,
    String? username,
    String? firstName,
    String? lastName,
    String? password,
    List<Location>? location,
  }) =>
      UserModel(
        created: created ?? this.created,
        updated: updated ?? this.updated,
        adverts: adverts ?? this.adverts,
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        location: location ?? this.location,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        created: DateTime.tryParse(json["created"]),
        updated:
            DateTime.tryParse(json["updated"]),
        adverts: (json['adverts'] as List).map((e) => AdvertModel.fromMap(e)).toList(),
        id: json["_id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        location: (json['location'] as List).map((e) => Location.fromMap(e)).toList(),
      );

  Map<String, dynamic> get toMap => {
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "adverts": adverts.map((e) => e.toMap),
        "_id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "location": location.map((e) => e.toString()).toList(),
      };

  @override
  String toString() => jsonEncode(toMap);
}
