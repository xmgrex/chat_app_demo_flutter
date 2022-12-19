import 'package:chat_app_demo_flutter/utils/document_refernce_converter.dart';
import 'package:chat_app_demo_flutter/utils/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'participating_chat.freezed.dart';
part 'participating_chat.g.dart';

@freezed
class ParticipatingChatRoom with _$ParticipatingChatRoom {
  factory ParticipatingChatRoom({
    required String id,
    required int unreadMessageCount,
    required String latestBody,
    @DocumentReferenceConverter() chatRef,
    @TimestampConverter() updatedAt,
  }) = _ParticipatingChatRoom;

  factory ParticipatingChatRoom.fromJson(Map<String, dynamic> json) => _$ParticipatingChatRoomFromJson(json);
}
