import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);
    if (productService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Productos'),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
            icon: const Icon(Icons.arrow_back_outlined)),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: productService.products.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              productService.selectedProduct = productService.products[index];
              Route route = CupertinoPageRoute(
                  builder: (context) => const ProductScreen());
              Navigator.push(context, route);
            },
            child: ProductCard(
              product: productService.products[index],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productService.selectedProduct =
              Product(available: false, name: '', price: 0);
          Navigator.pushNamed(context, 'product');
        },
        child: const Icon(Icons.add),
      ),
    );

    //
  }
}
