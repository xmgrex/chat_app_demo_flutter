import 'package:chat_app_demo_flutter/features/more/domain/more_stack_data.dart';
import 'package:chat_app_demo_flutter/features/top_level_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reusable_widgets/flutter_reusable_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:instant_text_styles/instant_text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../utils/app_colors.dart';

final moreList = [
  MoreStackData(icon: PhosphorIcons.user, title: 'Account'),
  MoreStackData(icon: PhosphorIcons.chatCircle, title: 'Chats'),
  MoreStackData(icon: PhosphorIcons.sunDim, title: 'Appearance'),
  MoreStackData(icon: PhosphorIcons.bell, title: 'Notification'),
  MoreStackData(icon: PhosphorIcons.shieldWarning, title: 'Privacy'),
  MoreStackData(icon: PhosphorIcons.question, title: 'Help'),
  MoreStackData(
      icon: PhosphorIcons.envelopeSimple, title: 'Invite Your Friends'),
];

class MorePage extends ConsumerWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(firebaseAuthProvider).currentUser;
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListTile(
            leading: ImageFromUrl(imageUrl: user!.photoURL!, radius: 60),
            title: Text(
              user.displayName ?? 'NoName',
              style: TextStyles.body.large,
            ),
            subtitle: Text(user.email!),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
          ),
          ...moreList.map((more) {
            return ListTile(
              leading: Icon(
                more.icon,
                color: AppColors.iconColorFromBackground(
                  Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              title: Text(more.title, style: TextStyles.body.large),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
              ),
            );
          }).toList(),
          ListTile(
            leading: Icon(
              PhosphorIcons.signOut,
              color: AppColors.iconColorFromBackground(
                Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            title: Text('SignOut', style: TextStyles.body.large),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () => FlutterFireUIAuth.signOut(),
          ),
        ],
      )),
    );
  }
}
