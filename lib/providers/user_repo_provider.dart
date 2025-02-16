
import 'package:fake_store/domain/user_repository.dart';
import 'package:fake_store/providers/app_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepoProvider = FutureProvider<UserRepository>((ref) {
  return UserRepository(ref.read(apiServicesProvider));
});