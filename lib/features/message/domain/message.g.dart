// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as String,
      body: json['body'] as String,
      type: json['type'] as String,
      from: json['from'] as String,
      createdAt: json['createdAt'],
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'type': instance.type,
      'from': instance.from,
      'createdAt': instance.createdAt,
    };
