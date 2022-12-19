import 'package:chat_app_demo_flutter/features/account/domain/app_user.dart';
import 'package:faker/faker.dart';
import 'package:uuid/uuid.dart';

final faker = Faker();

String image() => faker.image.image(keywords: ['portrait'], random: true);

final fakeUsers = List.generate(6, (index) {
  return AppUser(
    uid: const Uuid().v4(),
    displayName: faker.person.name(),
    photoURL: image(),
    onlineStatus: index == 2 || index == 5 ? 'Offline' : 'Online',
  );
});
