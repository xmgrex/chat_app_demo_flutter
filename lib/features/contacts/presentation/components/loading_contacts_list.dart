import 'package:card_loading/card_loading.dart';
import 'package:chat_app_demo_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/chat_loading.dart';

class LoadingContactsList extends StatelessWidget {
  const LoadingContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: List.generate(10, (index) => const ChatLoading()),
    );
  }
}
