import 'package:fantastic_assistant/services/cubits/firebase_auth_current_user.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String env) async {
  getIt.init(environment: env);
  getIt.registerLazySingleton<FirebaseAuthCurrentUser>(
      () => FirebaseAuthCurrentUser());
}
