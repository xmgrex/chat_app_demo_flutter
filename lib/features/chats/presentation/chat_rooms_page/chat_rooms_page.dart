import 'package:chat_app_demo_flutter/common_widgets/search_bar.dart';
import 'package:chat_app_demo_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'chat_rooms_list_view.dart';

class ChatRoomsPage extends ConsumerWidget {
  const ChatRoomsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(PhosphorIcons.listPlusBold),
          )
        ],
      ),
      body: ListView(
        primary: true,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        children: const [
          SearchBar(hint: 'Search'),
          Constants.gap16,
          ChatRoomsListView(),
        ],
      ),
    );
  }
}
