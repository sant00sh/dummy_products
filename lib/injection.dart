import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'data/datasources/product_remote_datasource.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/repositories/product_repository.dart';
import 'domain/usecases/get_products_usecase.dart';
import 'presentation/cubit/product_cubit.dart';

final sl = GetIt.instance;

void init() {
  // Cubit
  sl.registerFactory(() => ProductCubit(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton(() => ProductRemoteDataSource(Dio()));
}
