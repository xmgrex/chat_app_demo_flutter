import 'package:chat_app_demo_flutter/features/chats/domain/participating_chat/participating_chat.dart';
import 'package:flutter/material.dart';

class ChatsListViewBuilder extends StatelessWidget {
  const ChatsListViewBuilder({
    super.key,
    required this.participatingChatRooms,
    required this.itemBuilder,
  });

  final List<ParticipatingChatRoom> participatingChatRooms;
  final Widget Function(
          BuildContext context, int index, ParticipatingChatRoom participatingChatRoom)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: participatingChatRooms.length,
      itemBuilder: (context, index) {
        return itemBuilder(context, index, participatingChatRooms[index]);
      },
    );
  }
}
