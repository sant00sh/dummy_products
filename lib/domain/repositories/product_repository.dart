import 'package:dartz/dartz.dart';
import '../entities/product_entity.dart';
import '../../core/error/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts(int limit, int page);
}
