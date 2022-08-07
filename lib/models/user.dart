import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()

class User {
  int? id;
  String? first_name;
  String? email;
  String? username;
  String? password;
  int? userID ;

  User({
    this.id,
    this.userID,
    this.first_name,
    this.email,
      this.username,
    this.password,
  });


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}