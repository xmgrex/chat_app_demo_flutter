import 'package:chat_app_demo_flutter/common_widgets/avatar_image.dart';
import 'package:chat_app_demo_flutter/enums/app_route.dart';
import 'package:chat_app_demo_flutter/features/account/domain/app_user.dart';
import 'package:chat_app_demo_flutter/features/chats/domain/chat/chat_room.dart';
import 'package:chat_app_demo_flutter/features/contacts/data/contacts_repository.dart';
import 'package:chat_app_demo_flutter/features/top_level_providers.dart';
import 'package:chat_app_demo_flutter/utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_utils/flutter_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:go_router/go_router.dart';

class ContactStack extends ConsumerWidget {
  const ContactStack({super.key, required this.user});

  final AppUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: AvatarImage(user: user),
      title: Text(user.displayName),
      subtitle: Text(user.onlineStatus),
      trailing: IconButton(
        icon: Icon(
          PhosphorIcons.chatCircleFill,
          color: AppColors.iconColorFromBackground(
            Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        onPressed: () async {
          final currentUser = ref.read(firebaseAuthProvider).currentUser;
          final chatRoom = ChatRoom(
            id: user.uid,
            name: user.displayName,
            iconURL: user.photoURL,
            userIds: [currentUser!.uid, user.uid],
            updatedAt: Timestamp.now(),
          );
          await ref
              .read(contactsRepositoryProvider)
              .createChatRoom(chatRoom)
              .then((_) {
            context.pushNamed(AppRoute.messageScreen.name, extra: chatRoom);
          }).catchError((onError) {
            logger.warning(onError.toString());
          });
        },
      ),
    );
  }
}
