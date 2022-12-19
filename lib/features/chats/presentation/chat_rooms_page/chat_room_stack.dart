import 'package:chat_app_demo_flutter/enums/app_route.dart';
import 'package:chat_app_demo_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reusable_widgets/flutter_reusable_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instant_text_styles/instant_text_styles.dart';

import '../../../../common_widgets/chat_loading.dart';
import '../../../../services/firestore_database.dart';
import '../../domain/participating_chat/participating_chat.dart';
import 'package:go_router/go_router.dart';

class ChatRoomStack extends ConsumerWidget {
  const ChatRoomStack({super.key, required this.participatingChatRoom});
  final ParticipatingChatRoom participatingChatRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomValue =
        ref.watch(chatRoomProvider(participatingChatRoom.chatRef));
    return AsyncValueWidget(
      value: chatRoomValue,
      data: (chatRoom) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SizedBox(
            height: 56.0,
            width: 56.0,
            child: ImageFromUrl(
              imageUrl: chatRoom.iconURL,
              height: 48.0,
              width: 48.0,
            ),
          ),
          title: Text(chatRoom.name),
          subtitle: Text(participatingChatRoom.latestBody),
          trailing: participatingChatRoom.unreadMessageCount == 0
              ? const SizedBox.shrink()
              : Container(
                  height: 20.0,
                  width: 22.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryBackground,
                  ),
                  child: Center(
                    child: Text(
                      '${participatingChatRoom.unreadMessageCount}',
                      style: TextStyles.label.small.black,
                    ),
                  )),
          onTap: () {
            Future(() => ref.read(readMessageProvider(participatingChatRoom)));
            context.pushNamed(AppRoute.messageScreen.name, extra: chatRoom);
          },
        );
      },
      loading: () => const ChatLoading(),
    );
  }
}
