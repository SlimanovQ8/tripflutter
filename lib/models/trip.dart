import 'package:json_annotation/json_annotation.dart';
part 'trip.g.dart';
@JsonSerializable()

class Trip {
  int? id;
  String? title;
  String? description;
  String? image;
  int? user;

  Trip({
    this.id,
    this.title,
    this.description,
    this.image,
    this.user,
  });


  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
  Map<String, dynamic> toJson() => _$TripToJson(this);
}