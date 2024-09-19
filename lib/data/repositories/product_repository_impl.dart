import 'package:dartz/dartz.dart';
import 'package:dummy_products/core/utils/extensions.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../../core/error/failures.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
      int limit, int page) async {
    try {
      final products = await remoteDataSource.getProducts(limit, page);
      return Right(products.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
