// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participating_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParticipatingChatRoom _$$_ParticipatingChatRoomFromJson(
        Map<String, dynamic> json) =>
    _$_ParticipatingChatRoom(
      id: json['id'] as String,
      unreadMessageCount: json['unreadMessageCount'] as int,
      latestBody: json['latestBody'] as String,
      chatRef: json['chatRef'],
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$_ParticipatingChatRoomToJson(
        _$_ParticipatingChatRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unreadMessageCount': instance.unreadMessageCount,
      'latestBody': instance.latestBody,
      'chatRef': instance.chatRef,
      'updatedAt': instance.updatedAt,
    };
