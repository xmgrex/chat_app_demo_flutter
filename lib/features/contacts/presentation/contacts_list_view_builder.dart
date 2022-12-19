import 'package:flutter/material.dart';

import '../../account/domain/app_user.dart';

class ContactsListViewBuilder extends StatelessWidget {
  const ContactsListViewBuilder({
    super.key,
    required this.contacts,
    required this.itemBuilder,
  });

  final List<AppUser> contacts;
  final Widget Function(BuildContext context, int index, AppUser user)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: contacts.length,
      itemBuilder: ((context, index) {
        return itemBuilder(context, index, contacts[index]);
      }),
      separatorBuilder: ((context, index) => const Divider(
            height: 12.0,
          )),
    );
  }
}
