import 'package:bookly_clean_arch_app/Features/home/data/data_source/home_local_date_sources.dart';
import 'package:bookly_clean_arch_app/Features/home/data/data_source/home_remote_data_sources.dart';
import 'package:bookly_clean_arch_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch_app/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiServices>(
     ApiServices(
          Dio(),
        ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSources: HomeRemoteDataSourcesImpl(
       getIt.get<ApiServices>()
      ),
      homeLocalDateSources: HomeLocalDataSourcesImpl(),
    ),
  );
}
