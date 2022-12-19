import 'package:chat_app_demo_flutter/features/message/domain/message.dart';
import 'package:chat_app_demo_flutter/features/top_level_providers.dart';
import 'package:chat_app_demo_flutter/utils/app_colors.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instant_text_styles/instant_text_styles.dart';

class MessagesBuilder extends ConsumerWidget {
  const MessagesBuilder({Key? key, required this.messages}) : super(key: key);

  final List<Message> messages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: ((context, index) {
        final isSender = ref.read(firebaseAuthProvider).currentUser!.uid ==
            messages[index].from;
        final isDark = Theme.of(context).brightness == Brightness.dark;

        final bubbleColor =
            isDark ? AppColors.neutralActive : AppColors.neutralWhite;
        final senderBubbleColor =
            isDark ? AppColors.primary : AppColors.primaryDefault;
        return BubbleNormal(
          text: messages[index].body,
          isSender: isSender,
          color: isSender ? senderBubbleColor : bubbleColor,
          textStyle: TextStyles.body.large.copyWith(
            color: AppColors.textColorFromBackground(
              isSender ? senderBubbleColor : bubbleColor,
            ),
          ),
          tail: true,
        );
      }),
    );
  }
}
