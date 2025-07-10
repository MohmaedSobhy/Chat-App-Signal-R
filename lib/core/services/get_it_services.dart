import 'package:chat_app/Feature/auth/data/repository/auth_repository_implmentation.dart';
import 'package:chat_app/Feature/home/data/repo/chat_repository_implmentation.dart';
import 'package:chat_app/core/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

abstract class GetItServices {
  static final GetIt getIt = GetIt.instance;
  static void setup() {
    getIt.registerLazySingleton<AuthRepositoryImplmentation>(
      () => AuthRepositoryImplmentation(),
    );
    getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());
    getIt.registerLazySingleton<ChatRepositoryImplmentation>(
      () => ChatRepositoryImplmentation(),
    );
  }
}
