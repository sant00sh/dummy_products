import 'dart:io' show Platform;
import 'package:dummy_products/core/constants/strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';
import 'product_search_delegate.dart';
import '../widgets/product_list_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  ProductListScreenState createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final int _loadLimit = 10;

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().loadProducts(_loadLimit);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<ProductCubit>().loadProducts(_loadLimit);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildPlatformLoader() {
    if (Platform.isIOS) {
      return const CupertinoActivityIndicator();
    } else {
      return const CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.products),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: ProductSearchDelegate(
                    context.read<ProductCubit>(),
                  ));
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.isLoading && state.products.isEmpty) {
            return Center(child: _buildPlatformLoader());
          } else if (state.hasError) {
            return const Center(
              child: Text(StringConstants.errorLoadingProducts),
            );
          }

          final itemCount = state.isLoading
              ? state.products.length + 1
              : state.products.length;

          return ListView.builder(
            controller: _scrollController,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              if (index < state.products.length) {
                final product = state.products[index];
                return ProductListItem(product: product);
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(child: _buildPlatformLoader()),
                );
              }
            },
          );
        },
      ),
    );
  }
}
