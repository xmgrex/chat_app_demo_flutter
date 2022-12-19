import 'package:chat_app_demo_flutter/utils/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {

  factory Message({
    required String id,
    required String body,
    required String type,
    required String from,
    @TimestampConverter() createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}