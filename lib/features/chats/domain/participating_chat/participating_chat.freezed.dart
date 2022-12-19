// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participating_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ParticipatingChatRoom _$ParticipatingChatRoomFromJson(
    Map<String, dynamic> json) {
  return _ParticipatingChatRoom.fromJson(json);
}

/// @nodoc
mixin _$ParticipatingChatRoom {
  String get id => throw _privateConstructorUsedError;
  int get unreadMessageCount => throw _privateConstructorUsedError;
  String get latestBody => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  dynamic get chatRef => throw _privateConstructorUsedError;
  @TimestampConverter()
  dynamic get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipatingChatRoomCopyWith<ParticipatingChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipatingChatRoomCopyWith<$Res> {
  factory $ParticipatingChatRoomCopyWith(ParticipatingChatRoom value,
          $Res Function(ParticipatingChatRoom) then) =
      _$ParticipatingChatRoomCopyWithImpl<$Res, ParticipatingChatRoom>;
  @useResult
  $Res call(
      {String id,
      int unreadMessageCount,
      String latestBody,
      @DocumentReferenceConverter() dynamic chatRef,
      @TimestampConverter() dynamic updatedAt});
}

/// @nodoc
class _$ParticipatingChatRoomCopyWithImpl<$Res,
        $Val extends ParticipatingChatRoom>
    implements $ParticipatingChatRoomCopyWith<$Res> {
  _$ParticipatingChatRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? unreadMessageCount = null,
    Object? latestBody = null,
    Object? chatRef = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      unreadMessageCount: null == unreadMessageCount
          ? _value.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
      latestBody: null == latestBody
          ? _value.latestBody
          : latestBody // ignore: cast_nullable_to_non_nullable
              as String,
      chatRef: freezed == chatRef
          ? _value.chatRef
          : chatRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ParticipatingChatRoomCopyWith<$Res>
    implements $ParticipatingChatRoomCopyWith<$Res> {
  factory _$$_ParticipatingChatRoomCopyWith(_$_ParticipatingChatRoom value,
          $Res Function(_$_ParticipatingChatRoom) then) =
      __$$_ParticipatingChatRoomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int unreadMessageCount,
      String latestBody,
      @DocumentReferenceConverter() dynamic chatRef,
      @TimestampConverter() dynamic updatedAt});
}

/// @nodoc
class __$$_ParticipatingChatRoomCopyWithImpl<$Res>
    extends _$ParticipatingChatRoomCopyWithImpl<$Res, _$_ParticipatingChatRoom>
    implements _$$_ParticipatingChatRoomCopyWith<$Res> {
  __$$_ParticipatingChatRoomCopyWithImpl(_$_ParticipatingChatRoom _value,
      $Res Function(_$_ParticipatingChatRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? unreadMessageCount = null,
    Object? latestBody = null,
    Object? chatRef = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_ParticipatingChatRoom(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      unreadMessageCount: null == unreadMessageCount
          ? _value.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
      latestBody: null == latestBody
          ? _value.latestBody
          : latestBody // ignore: cast_nullable_to_non_nullable
              as String,
      chatRef: freezed == chatRef ? _value.chatRef! : chatRef,
      updatedAt: freezed == updatedAt ? _value.updatedAt! : updatedAt,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParticipatingChatRoom implements _ParticipatingChatRoom {
  _$_ParticipatingChatRoom(
      {required this.id,
      required this.unreadMessageCount,
      required this.latestBody,
      @DocumentReferenceConverter() this.chatRef,
      @TimestampConverter() this.updatedAt});

  factory _$_ParticipatingChatRoom.fromJson(Map<String, dynamic> json) =>
      _$$_ParticipatingChatRoomFromJson(json);

  @override
  final String id;
  @override
  final int unreadMessageCount;
  @override
  final String latestBody;
  @override
  @DocumentReferenceConverter()
  final dynamic chatRef;
  @override
  @TimestampConverter()
  final dynamic updatedAt;

  @override
  String toString() {
    return 'ParticipatingChatRoom(id: $id, unreadMessageCount: $unreadMessageCount, latestBody: $latestBody, chatRef: $chatRef, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ParticipatingChatRoom &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.unreadMessageCount, unreadMessageCount) ||
                other.unreadMessageCount == unreadMessageCount) &&
            (identical(other.latestBody, latestBody) ||
                other.latestBody == latestBody) &&
            const DeepCollectionEquality().equals(other.chatRef, chatRef) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      unreadMessageCount,
      latestBody,
      const DeepCollectionEquality().hash(chatRef),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ParticipatingChatRoomCopyWith<_$_ParticipatingChatRoom> get copyWith =>
      __$$_ParticipatingChatRoomCopyWithImpl<_$_ParticipatingChatRoom>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParticipatingChatRoomToJson(
      this,
    );
  }
}

abstract class _ParticipatingChatRoom implements ParticipatingChatRoom {
  factory _ParticipatingChatRoom(
          {required final String id,
          required final int unreadMessageCount,
          required final String latestBody,
          @DocumentReferenceConverter() final dynamic chatRef,
          @TimestampConverter() final dynamic updatedAt}) =
      _$_ParticipatingChatRoom;

  factory _ParticipatingChatRoom.fromJson(Map<String, dynamic> json) =
      _$_ParticipatingChatRoom.fromJson;

  @override
  String get id;
  @override
  int get unreadMessageCount;
  @override
  String get latestBody;
  @override
  @DocumentReferenceConverter()
  dynamic get chatRef;
  @override
  @TimestampConverter()
  dynamic get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ParticipatingChatRoomCopyWith<_$_ParticipatingChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
