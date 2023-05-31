import 'package:get_it/get_it.dart';

import '../data_sources/local/local_data_source.dart';
import '../data_sources/remote/remote_data_source.dart';
import '../repository/user_repository.dart';

final getIt = GetIt.instance;

void initModule() {
  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSource(),
  );

  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSource(),
  );

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(
      getIt(),
      getIt(),
    ),
  );
}
