import '../../domain/entities/product_entity.dart';

class ProductState {
  final List<ProductEntity> products;
  final bool isLoading;
  final bool hasError;
  final Set<int> favoriteIds;

  ProductState({
    this.products = const [],
    this.isLoading = false,
    this.hasError = false,
    this.favoriteIds = const {},
  });

  ProductState copyWith({
    List<ProductEntity>? products,
    bool? isLoading,
    bool? hasError,
    Set<int>? favoriteIds,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      favoriteIds: favoriteIds ?? this.favoriteIds,
    );
  }
}
