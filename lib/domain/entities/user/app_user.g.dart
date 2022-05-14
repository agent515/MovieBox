// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      uid: json['uid'] as String,
      email: json['email'] as String,
      dob: DateTime.parse(json['dob'] as String),
      watchlists: (json['watchlists'] as List<dynamic>?)
              ?.map((e) => Watchlist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'dob': instance.dob.toIso8601String(),
      'watchlists': instance.watchlists,
    };
