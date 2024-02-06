import 'package:creativa_tasks/model/cart_model.dart';
import 'package:dio/dio.dart';

class CartService {
  static Future<CartModel> getCardData() async {
    final dio = Dio();
    Response cardResponse = await dio.get('https://dummyjson.com/carts');
    CartModel cartModel = CartModel.fromMap(cardResponse.data['carts'][0]);
    return cartModel;
  }
}
