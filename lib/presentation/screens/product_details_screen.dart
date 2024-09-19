import 'package:dummy_products/core/constants/strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/product_cubit.dart';
import '../../domain/entities/product_entity.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isFavorite =
        context.watch<ProductCubit>().state.favoriteIds.contains(product.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(product.image, height: 200, width: double.infinity),
            const SizedBox(height: 20),
            Text('\$${product.price}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(product.description),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<ProductCubit>().toggleFavorite(product);
              },
              child: Text(isFavorite
                  ? StringConstants.unmarkFavorite
                  : StringConstants.markFavorite),
            ),
          ],
        ),
      ),
    );
  }
}
