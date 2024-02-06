import 'package:creativa_tasks/services/get_cart_service.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: FutureBuilder(
        future: CartService.getCardData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final products = snapshot.data!.products;

          return ListView.separated(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(products[index].thumbnail),
                  ),
                  title: Text(products[index].title),
                  subtitle: Text('${products[index].price}\$'),
                  trailing: Column(
                    children: [
                      Text('Quantity: ${products[index].quantity}'),
                      Text('discount: ${products[index].discountedPrice}\$'),
                      Text('Total: ${products[index].total}'),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
          );
        },
      ),
    );
  }
}
