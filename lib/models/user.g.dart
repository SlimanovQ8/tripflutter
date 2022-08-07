// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      userID: json['user_id'] as int?,
      first_name: json['first_name'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userID,
      'first_name': instance.first_name,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
    };
