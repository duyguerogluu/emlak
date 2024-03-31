import 'dart:convert';

import 'package:emlak/models/photo_model.dart';
import 'package:emlak/models/user_model.dart';

class AdvertModel {
  final String title;
  final String description;
  final UserModel? author;
  final List<PhotoModel> images;
  final Location location;
  final Price price;
  final DateTime? created;
  final DateTime? modified;
  final int status;
  // final StatusChanger statusChanger;
  final String? advertId;
  final String advertType;
  final int m2Gross;
  final int m2Net;
  final Rooms rooms;
  final int apartmentFloor;
  final int apartmentTotalFloor;
  final String heatingType;
  final bool inSite;
  final String siteName;

  AdvertModel({
    required this.title,
    this.description = "",
    this.author,
    this.images = const [],
    required this.location,
    required this.price,
    this.created,
    this.modified,
    this.status = 0,
    // required this.statusChanger,
    this.advertId,
    required this.advertType,
    required this.m2Gross,
    required this.m2Net,
    required this.rooms,
    this.apartmentFloor = 0,
    this.apartmentTotalFloor = 0,
    this.heatingType = "",
    this.inSite = false,
    this.siteName = "",
  });

  factory AdvertModel.fromMap(Map<String, dynamic> json) {
    List images = json['images'] ?? [];

    return AdvertModel(
      title: json['title'],
      description: json['description'],
      author: UserModel.fromMap(json['author']),
      images: images.map((e) => PhotoModel.fromMap(e)).toList(),
      location: Location.fromMap(json['location']),
      price: Price.fromMap(json['price']),
      created: DateTime.tryParse(json['created']),
      modified: DateTime.tryParse(json['modified']),
      status: json['status'],
      advertId: json['_id'],
      advertType: json['advert_type'],
      m2Gross: json['m2_gross'],
      m2Net: json['m2_net'],
      rooms: Rooms.fromMap(json['rooms']),
      apartmentFloor: json['apartment_floor'],
      apartmentTotalFloor: json['apartment_total_floor'],
      heatingType: json['heating_type'],
      inSite: json['in_site'],
      siteName: json['site_name'],
    );
  }

  Map<String, dynamic> get toMap => {
        'title': title,
        'description': description,
        'author': author?.toMap,
        'images': images.map((e) => e.toMap),
        'location': location.toMap,
        'price': price.toMap,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
        'status': status,
        '_id': advertId,
        'advert_tyoe': advertType,
        'm2_gross': m2Gross,
        'm2_net': m2Net,
        'rooms': rooms.toMap,
        'apartment_floor': apartmentFloor,
        'apartment_total_floor': apartmentTotalFloor,
        'heating_type': heatingType,
        'in_site': inSite,
        'siteName': siteName,
      };

  @override
  String toString() => jsonEncode(toMap);
}

/*
{
    "region": "The region of the user - eg. Buyukcekmece",
    "city": "The city of the user - eg. Istanbul",
    "country": "The country of the user - eg. TR - defaults to TR",
    "geo": {
        "lat": "latitude of the location",
        "lon": "longtitude of the location",
    }
}
*/
class Location {
  final String region;
  final String city;
  final String country;
  final Geo geo;

  const Location({
    required this.region,
    required this.city,
    this.country = 'TR',
    required this.geo,
  });

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        region: json['region'],
        city: json['city'],
        country: json['country'],
        geo: Geo.fromMap(json['geo']),
      );

  Map<String, dynamic> get toMap => {
        'region': region,
        'city': city,
        'country': country,
        'geo': geo.toMap,
      };

  @override
  String toString() => jsonEncode(toMap);
}

class Geo {
  final double lat;
  final double lon;

  const Geo({
    required this.lat,
    required this.lon,
  });

  factory Geo.fromMap(Map<String, dynamic> json) => Geo(
        lat: json['lat'],
        lon: json['lon'],
      );

  Map<String, dynamic> get toMap => {
        'lat': lat,
        'lon': lon,
      };

  @override
  String toString() => jsonEncode(toMap);
}

class Price {
  final double amount;
  final String currency;

  const Price({
    required this.amount,
    this.currency = 'TRY',
  });

  factory Price.fromMap(Map<String, dynamic> json) => Price(
        amount: json['amount'],
        currency: json['currency'],
      );

  Map<String, dynamic> get toMap => {
        'amount': amount,
        'currency': currency,
      };

  @override
  String toString() => jsonEncode(toMap);
}

/*
class StatusChanger {
  final UserModel author;
  final String reason;
  final DateTime changed;

  const StatusChanger({
    required this.author,
    this.reason = "",
    required this.changed,
  });
}
*/

class Rooms {
  final int livingRoom;
  final int bath;
  final int toilet;
  final int other;

  const Rooms({
    required this.livingRoom,
    required this.bath,
    required this.toilet,
    required this.other,
  });

  String get toRoomCount => '$other+$livingRoom';

  factory Rooms.fromMap(Map<String, dynamic> json) => Rooms(
        livingRoom: json['living_room'],
        bath: json['bath'],
        toilet: json['toilet'],
        other: json['other'],
      );

  Map<String, dynamic> get toMap => {
        'living_room': livingRoom,
        'bath': bath,
        'toilet': toilet,
        'other': other,
      };

  @override
  String toString() => jsonEncode(toMap);
}
