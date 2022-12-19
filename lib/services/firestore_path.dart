class FirestorePath {
  static const version = 'v1';

  static String contacts(String uid) => 'social/$version/users/$uid/contacts';

  static String participatingChats(String uid) =>
      'social/$version/users/$uid/participatingChatRooms';

  static String participatingChatRoom(String uid, String roomId) =>
      'social/$version/users/$uid/participatingChatRooms/$roomId';

  static String chatRoom(String id) => 'social/$version/chatRooms/$id';

  static String chatRooms() => 'social/$version/chatRooms';

  static String messages(String roomId) =>
      'social/$version/chatRooms/$roomId/messages';

  static String message(String roomId, String messageId) =>
      'social/$version/chatRooms/$roomId/messages/$messageId';

  static String unreadMessageCounts(String uid, String roomId) =>
      '${participatingChatRoom(uid, roomId)}/unreadMessageCounts';
}
