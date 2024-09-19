import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../core/constants/api_endpoints.dart';
import '../models/product_model.dart';

part 'product_remote_datasource.g.dart';

@RestApi(baseUrl: APIEndpoints.baseUrl)
abstract class ProductRemoteDataSource {
  factory ProductRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProductRemoteDataSource;

  @GET(APIEndpoints.products)
  Future<List<ProductModel>> getProducts(
      @Query("limit") int limit, @Query("page") int page);
}
