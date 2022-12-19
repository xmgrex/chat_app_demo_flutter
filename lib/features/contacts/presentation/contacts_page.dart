import 'package:chat_app_demo_flutter/common_widgets/search_bar.dart';
import 'package:chat_app_demo_flutter/features/contacts/presentation/contacts_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instant_text_styles/instant_text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../utils/constants.dart';

class ContactsPage extends ConsumerWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts', style: TextStyles.title.large),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(PhosphorIcons.plusBold),
          )
        ],
      ),
      body: ListView(
        primary: true,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        children: const [
          SearchBar(hint: 'Search'),
          Constants.gap16,
          ContactsListView(),
        ],
      ),
    );
  }
}
