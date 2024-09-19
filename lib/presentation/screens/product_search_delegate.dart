import 'package:flutter/material.dart';
import '../../core/constants/strings_constants.dart';
import '../cubit/product_cubit.dart';
import '../widgets/product_list_item.dart';

class ProductSearchDelegate extends SearchDelegate {
  final ProductCubit productCubit;

  ProductSearchDelegate(this.productCubit);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final state = productCubit.state;
    final filteredProducts = state.products.where((product) {
      return product.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filteredProducts.isEmpty) {
      return const Center(child: Text(StringConstants.noProducts));
    }

    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return ProductListItem(product: product);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
