import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ChatLoading extends StatelessWidget {
const ChatLoading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final carLoadingTheme = CardLoadingTheme(
      colorOne: isDark ? AppColors.neutralDark : AppColors.neutralLine,
      colorTwo: isDark ? AppColors.neutralBody : AppColors.neutralOffWhite,
    );
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CardLoading(
        cardLoadingTheme: carLoadingTheme,
        borderRadius: BorderRadius.circular(16),
        height: 56.0,
        width: 56.0,
      ),
      title: CardLoading(
        cardLoadingTheme: carLoadingTheme,
        margin: const EdgeInsets.only(bottom: 4),
        borderRadius: BorderRadius.circular(6),
        height: 14,
        width: 120,
      ),
      subtitle: CardLoading(
        cardLoadingTheme: carLoadingTheme,
        margin: const EdgeInsets.only(top: 4),
        borderRadius: BorderRadius.circular(6),
        height: 12,
      ),
    );
  }
}