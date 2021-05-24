// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    Name.fromJson(json['name'] as Map<String, dynamic>),
    Location.fromJson(json['location'] as Map<String, dynamic>),
    json['gender'] as String,
    json['email'] as String,
    json['phone'] as String,
    json['cell'] as String,
    Picture.fromJson(json['picture'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'name': instance.name.toJson(),
      'location': instance.location.toJson(),
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
      'cell': instance.cell,
      'picture': instance.picture.toJson(),
    };

Name _$NameFromJson(Map<String, dynamic> json) {
  return Name(
    json['title'] as String,
    json['first'] as String,
    json['last'] as String,
  );
}

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'title': instance.title,
      'first': instance.first,
      'last': instance.last,
    };

Picture _$PictureFromJson(Map<String, dynamic> json) {
  return Picture(
    json['large'] as String,
    json['medium'] as String,
    json['thumbnail'] as String,
  );
}

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'thumbnail': instance.thumbnail,
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    Street.fromJson(json['street'] as Map<String, dynamic>),
    json['city'] as String,
    json['state'] as String,
    json['postcode'].toString(), //TODO automata int-string
    Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    Timezone.fromJson(json['timezone'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'street': instance.street.toJson(),
      'city': instance.city,
      'state': instance.state,
      'postcode': instance.postcode,
      'coordinates': instance.coordinates.toJson(),
      'timezone': instance.timezone.toJson(),
    };

Street _$StreetFromJson(Map<String, dynamic> json) {
  return Street(
    json['number'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$StreetToJson(Street instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(
    json['latitude'] as String,
    json['longitude'] as String,
  );
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Timezone _$TimezoneFromJson(Map<String, dynamic> json) {
  return Timezone(
    json['offset'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$TimezoneToJson(Timezone instance) => <String, dynamic>{
      'offset': instance.offset,
      'description': instance.description,
    };
