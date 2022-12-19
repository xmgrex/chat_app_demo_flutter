import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CreateChatRoomScreen extends ConsumerWidget {
  const CreateChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create ChatRoom'),
      ),
      
    );
  }
}
