import 'package:dummy_products/core/constants/strings_constants.dart';
import 'package:dummy_products/presentation/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_products_usecase.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase getProductsUseCase;
  final Box<int> favoriteBox = Hive.box<int>(StringConstants.favoritesBox);
  int _page = 1;

  ProductCubit(this.getProductsUseCase) : super(ProductState());

  // Load products
  Future<void> loadProducts(int limit) async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final failureOrProducts = await getProductsUseCase(Params(limit, _page));
    failureOrProducts.fold(
      (failure) => emit(state.copyWith(isLoading: false, hasError: true)),
      (products) {
        if (products.isNotEmpty) {
          _page++;
        }
        emit(state.copyWith(
          isLoading: false,
          hasError: false,
          products: [...state.products, ...products],
        ));
      },
    );
  }

  // Toggle favorite status
  Future<void> toggleFavorite(ProductEntity product) async {
    if (favoriteBox.containsKey(product.id)) {
      // If the product is already a favorite, remove it
      favoriteBox.delete(product.id);
    } else {
      // Otherwise, mark it as favorite
      favoriteBox.put(product.id, product.id);
    }

    // Reload favorites from Hive
    loadFavorites();
  }

  // Load favorite product IDs from Hive
  Future<void> loadFavorites() async {
    final favoriteIds = favoriteBox.keys.cast<int>().toSet();
    emit(state.copyWith(favoriteIds: favoriteIds));
  }
}
