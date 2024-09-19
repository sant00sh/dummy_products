import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';
import '../../core/usecase/usecase.dart';

class GetProductsUseCase implements UseCase<List<ProductEntity>, Params> {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(Params params) async {
    return await repository.getProducts(params.limit, params.page);
  }
}

class Params {
  final int limit;
  final int page;

  Params(this.limit, this.page);
}
