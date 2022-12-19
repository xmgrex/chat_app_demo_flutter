import 'package:chat_app_demo_flutter/utils/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    required String uid,
    required String displayName,
    required String photoURL,
    required String onlineStatus,
    @TimestampConverter() createdAt,
    @TimestampConverter() updatedAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
