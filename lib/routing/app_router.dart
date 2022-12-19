import 'package:chat_app_demo_flutter/enums/app_route.dart';
import 'package:chat_app_demo_flutter/features/home/presentation/home_screen.dart';
import 'package:chat_app_demo_flutter/routing/go_router_refresh_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:go_router/go_router.dart';

import '../features/chats/domain/chat/chat_room.dart';
import '../features/message/presentation/message_screen.dart';
import '../features/top_level_providers.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final firebaseAuth = ref.read(firebaseAuthProvider);
  return GoRouter(
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isSignIn = firebaseAuth.currentUser != null;
      if (!isSignIn) {
        return state.subloc == '/${AppRoute.signIn.name}'
            ? null
            : '/${AppRoute.signIn.name}';
      }
      if (state.subloc == '/${AppRoute.signIn.name}') {
        return '/';
      }
      if (isSignIn && firebaseAuth.currentUser!.displayName == null) {}
      return null;
    },
    refreshListenable: GoRouterRefreshStream(firebaseAuth.userChanges()),
    routes: [
      GoRoute(
        path: '/${AppRoute.signIn.name}',
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const SignInScreen(),
          );
        },
      ),
      GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: AppRoute.messageScreen.name,
              name: AppRoute.messageScreen.name,
              pageBuilder: (context, state) {
                final chatRoom = state.extra as ChatRoom;
                return MaterialPage(
                  key: state.pageKey,
                  child: MessageScreen(chatRoom: chatRoom),
                );
              },
            )
          ]),
    ],
    errorBuilder: ((context, state) {
      return Scaffold(
        appBar: AppBar(),
        body: const Text('404'),
      );
    }),
  );
});
