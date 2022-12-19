import 'package:chat_app_demo_flutter/features/chats/presentation/chat_rooms_page/chat_rooms_page.dart';
import 'package:chat_app_demo_flutter/features/contacts/presentation/contacts_page.dart';
import 'package:chat_app_demo_flutter/features/home/domain/stack_page.dart';
import 'package:chat_app_demo_flutter/features/home/presentation/animated_index_stack.dart';
import 'package:chat_app_demo_flutter/features/more/presentation/more_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    pages = const [
      StackPage(
        page: ContactsPage(),
        selectedIcon: PhosphorIcons.usersBold,
        unSelectedIcon: PhosphorIcons.users,
      ),
      StackPage(
        page: ChatRoomsPage(),
        selectedIcon: PhosphorIcons.chatCircleDotsBold,
        unSelectedIcon: PhosphorIcons.chatCircle,
      ),
      StackPage(
        page: MorePage(),
        selectedIcon: PhosphorIcons.dotsThreeOutlineBold,
        unSelectedIcon: PhosphorIcons.dotsThreeBold,
      ),
    ];
    super.initState();
  }

  late List<StackPage> pages;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedIndexedStack(
        index: currentIndex,
        children: pages.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: generateBottomNavBarItems(
          pages: pages,
          currentIndex: currentIndex,
        ),
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}

List<BottomNavigationBarItem> generateBottomNavBarItems({
  required List<StackPage> pages,
  required int currentIndex,
}) {
  return List.generate(pages.length, (index) {
    final page = pages[index];
    final icon =
        currentIndex == index ? page.selectedIcon : page.unSelectedIcon;
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 24),
      label: '',
    );
  });
}
