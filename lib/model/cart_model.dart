// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:creativa_tasks/model/product_model.dart';

class CartModel {
  int id;
  List<ProductModel> products;
  int total;
  int discountedTotal;
  int userId;
  int totalProducts;
  int totalQuantity;

  CartModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as int,
      products: List<ProductModel>.from(
        (map['products'] as List).map<ProductModel>(
          (x) => ProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      total: map['total'] as int,
      discountedTotal: map['discountedTotal'] as int,
      userId: map['userId'] as int,
      totalProducts: map['totalProducts'] as int,
      totalQuantity: map['totalQuantity'] as int,
    );
  }

  @override
  String toString() {
    return 'CartModel(id: $id, products: $products, total: $total, discountedTotal: $discountedTotal, userId: $userId, totalProducts: $totalProducts, totalQuantity: $totalQuantity)';
  }
}
