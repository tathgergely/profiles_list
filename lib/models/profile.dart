import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(explicitToJson: true)
class Profile {
  Name name;

  Profile(this.name, this.location, this.gender, this.email, this.phone,
      this.cell, this.picture);
  Location location;
  String gender, email, phone, cell;
  Picture picture;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Name {
  String title, first, last;

  Name(this.title, this.first, this.last);

  String getString()
  {
    return (first+" "+last);
  }
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Picture {
  String large, medium, thumbnail;

  Picture(this.large, this.medium, this.thumbnail);

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);

  Map<String, dynamic> toJson() => _$PictureToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Location {
  Street street;
  String city, state;
  String postcode;
  Coordinates coordinates;
  Timezone timezone;

  String getString()
  {
    return (postcode+" "+state+" "+city+"\n"+ street.getString());
  }
  Location(this.street, this.city, this.state, this.postcode, this.coordinates,
      this.timezone);

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
@JsonSerializable(explicitToJson: true)
class Street {
  int number;
  String name;

  String getString()
  {
    return name+" "+number.toString();
  }
  Street(this.number, this.name);

  factory Street.fromJson(Map<String, dynamic> json) =>
      _$StreetFromJson(json);

  Map<String, dynamic> toJson() => _$StreetToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Coordinates {
  String latitude, longitude;

  String getString()
  {
    return latitude+" "+longitude;
  }

  Coordinates(this.latitude, this.longitude);

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Timezone {
  String offset;
  String description;
  String getString()
  {
    return (offset+" "+description);
  }
  Timezone(this.offset, this.description);

  factory Timezone.fromJson(Map<String, dynamic> json) =>
      _$TimezoneFromJson(json);

  Map<String, dynamic> toJson() => _$TimezoneToJson(this);
}
