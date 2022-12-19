import 'package:chat_app_demo_flutter/features/contacts/presentation/components/loading_contacts_list.dart';
import 'package:chat_app_demo_flutter/features/contacts/presentation/contact_stack.dart';
import 'package:chat_app_demo_flutter/features/contacts/presentation/contacts_list_view_builder.dart';
import 'package:chat_app_demo_flutter/services/firestore_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reusable_widgets/flutter_reusable_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactsListView extends ConsumerWidget {
  const ContactsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactsValue = ref.watch(contactsStreamProvider);
    return AsyncValueWidget(
      value: contactsValue,
      data: (contacts) {
        return contacts.isEmpty
            ? const Center(child: Text('まだ連絡先がありません。'))
            : ContactsListViewBuilder(
                contacts: contacts,
                itemBuilder: (context, index, user) => ContactStack(user: user),
              );
      },
      loading: () => const LoadingContactsList(),
    );
  }
}
