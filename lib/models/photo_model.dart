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
