import 'package:json_annotation/json_annotation.dart';
part 'userProfile.g.dart';
@JsonSerializable()

class UserProfile {
  int? id;
  String? bio;
  String? image;
  int? user;

  UserProfile({
    this.id,
    this.bio,
    this.image,
    this.user,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}