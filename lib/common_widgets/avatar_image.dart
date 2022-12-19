import 'package:badges/badges.dart';
import 'package:chat_app_demo_flutter/features/account/domain/app_user.dart';
import 'package:chat_app_demo_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reusable_widgets/flutter_reusable_widgets.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key, required this.user});
  final AppUser user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0,
      width: 56.0,
      child: Badge(
        padding: user.onlineStatus == 'Online'
            ? const EdgeInsets.all(8.0)
            : EdgeInsets.zero,
        borderSide: const BorderSide(
          color: AppColors.neutralWhite,
          width: 2.0,
        ),
        badgeColor: AppColors.accentSuccess,
        position: BadgePosition.topEnd(top: -5, end: -5),
        child: SizedBox(
          height: 56.0,
          width: 56.0,
          child: ImageFromUrl(
            imageUrl: user.photoURL,
            radius: 16,
            width: 48,
            height: 48,
          ),
        ),
      ),
    );
  }
}
