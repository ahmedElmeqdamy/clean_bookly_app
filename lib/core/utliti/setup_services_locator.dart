import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_source/home_local_data_source.dart';
import '../../features/home/data/data_source/home_remote_data_source.dart';
import '../../features/home/data/repos/home_impl_repo.dart';

import 'api_services.dart';

final getIt = GetIt.instance;

void setupServicesLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeReposImpl>(
    HomeReposImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
}
