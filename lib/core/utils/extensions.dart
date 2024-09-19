import '../../data/models/product_model.dart';
import '../../domain/entities/product_entity.dart';

extension ProductModelX on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      image: image,
      price: price,
      description: description,
    );
  }
}