/*
 *  This file is part of emlak.
 *
 *  emlak is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  emlak is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *   along with emlak.  If not, see <https://www.gnu.org/licenses/>.
 */

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
