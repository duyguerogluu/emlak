import 'package:emlak/models/photo_model.dart';
import 'package:emlak/models/user_model.dart';

class Advert {
  String title;
  String description;
  UserModel author;
  List<PhotoModel> images;
  Location location;
  Price price;
  // DateTime created;
  // DateTime modified;
  int status;
  StatusChanger statusChanger;
  int advertId;
  String advertType;
  int m2Gross;
  int m2Net;
  Rooms rooms;
  int apartmentFloor;
  int apartmentTotalFloor;
  String heatingType;
  bool inSite;
  String siteName;

  Advert({
    required this.title,
    this.description = "",
    required this.author,
    required this.images,
    required this.location,
    required this.price,
    // this.created = DateTime.now(),
    // this.modified = DateTime.now(),
    this.status = 0,
    required this.statusChanger,
    required this.advertId,
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
}

class Location {
  String region;
  String city;
  String country;
  Geo geo;

  Location({
    required this.region,
    required this.city,
    this.country = 'TR',
    required this.geo,
  });
}

class Geo {
  double lat;
  double lon;

  Geo({
    required this.lat,
    required this.lon,
  });
}

class Price {
  double amount;
  String currency;

  Price({
    required this.amount,
    this.currency = 'TRY',
  });
}

class StatusChanger {
  UserModel author;
  String reason;
  DateTime changed;

  StatusChanger({
    required this.author,
    this.reason = "",
    required this.changed,
  });
}

class Rooms {
  int livingRoom;
  int bath;
  int toilet;
  int other;

  Rooms({
    required this.livingRoom,
    required this.bath,
    required this.toilet,
    required this.other,
  });
}
