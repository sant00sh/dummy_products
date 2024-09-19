import 'package:flutter/material.dart';
import '../../domain/entities/product_entity.dart';
import '../screens/product_details_screen.dart';

class ProductListItem extends StatelessWidget {
  final ProductEntity product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.image, width: 50, height: 50),
      title: Text(product.title),
      subtitle: Text('\$${product.price}'),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
    );
  }
}
