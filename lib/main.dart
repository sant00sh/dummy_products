import 'package:dummy_products/core/constants/strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'injection.dart' as di;
import 'presentation/cubit/product_cubit.dart';
import 'presentation/screens/product_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();
  await Hive.initFlutter();
  await Hive.openBox<int>(StringConstants.favoritesBox);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ProductCubit>()..loadFavorites(),
      child: const MaterialApp(
        home: ProductListScreen(),
      ),
    );
  }
}
