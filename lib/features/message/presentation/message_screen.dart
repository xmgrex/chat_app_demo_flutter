import 'package:chat_app_demo_flutter/features/chats/domain/chat/chat_room.dart';
import 'package:chat_app_demo_flutter/features/message/domain/message.dart';
import 'package:chat_app_demo_flutter/features/message/presentation/messages_builder.dart';
import 'package:chat_app_demo_flutter/features/top_level_providers.dart';
import 'package:chat_app_demo_flutter/utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reusable_widgets/flutter_reusable_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_utils/flutter_utils.dart';

import '../../../services/firestore_database.dart';
import 'components/message_bar.dart';

class MessageScreen extends ConsumerWidget {
  const MessageScreen({super.key, required this.chatRoom});

  final ChatRoom chatRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesValue = ref.watch(messagesProvider(chatRoom.id));
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor:
              isDark ? AppColors.neutralDark : AppColors.neutralOffWhite,
          appBar: AppBar(
            title: Text(chatRoom.name),
          ),
          body: Stack(
            children: [
              AsyncValueWidget(
                value: messagesValue,
                data: (messages) {
                  logger.info(messages.toString());
                  return messages.isEmpty
                      ? const SizedBox.shrink()
                      : MessagesBuilder(messages: messages);
                },
                loading: () => const SizedBox.shrink(),
              ),
              CustomMessageBar(
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.neutralDisabled,
                      ))
                ],
                hint: 'メッセージを入力',
                onSend: (body) async {
                  final uid = ref.read(firebaseAuthProvider).currentUser!.uid;
                  final message = Message(
                    id: '',
                    body: body,
                    type: 'message',
                    from: uid,
                    createdAt: Timestamp.now(),
                  );
                  await ref
                      .read(databaseProvider)!
                      .cerateMessage(chatRoom, message);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
