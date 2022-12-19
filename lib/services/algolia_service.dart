import 'package:algolia/algolia.dart';
import 'package:chat_app_demo_flutter/features/account/domain/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'algolia_service.g.dart';

class AlgoliaService {
  AlgoliaService(this.ref);
  final Ref ref;

  static const Algolia algolia = Algolia.init(
    applicationId: 'YOUR_APPLICATION_ID',
    apiKey: 'YOUR_API_KEY',
  );

  Future<List<AppUser>> searchContacts(String keyword) async {
    final results = await algolia.index('users').query(keyword).getObjects();
    return results.hits.map((e) => AppUser.fromJson(e.data)).toList();
  }
}

@riverpod
AlgoliaService algoliaService(Ref ref) {
  return AlgoliaService(ref);
}
