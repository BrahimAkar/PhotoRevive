import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:photo_revive/data/data_source/remote_data_source.dart';
import 'package:photo_revive/data/network/app_api.dart';
import 'package:photo_revive/data/network/network_info.dart';
import 'package:photo_revive/data/network/dio_factory.dart';
import 'package:photo_revive/data/repository/repository_implementer.dart';
import 'package:photo_revive/domain/repositories/repository.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  //
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));
  instance.registerLazySingleton<Repository>(
      () => RepositoryImplementer(instance(), instance()));
}
