import 'package:fluttertoast/fluttertoast.dart';
import 'package:iide_flutter_test/core/constants.dart';
import 'package:iide_flutter_test/core/helpers.dart';
import 'package:iide_flutter_test/models/product.dart';

List<Product> products = dummyData.map((e) => Product.fromJson(e)).toList();

/// get all products
List<Product> getAllProducts() {
  return products;
}

/// get all products in Cart
List<Product> getCart() {
  return products.where((product) => product.inCart == true).toList();
}

// calculate cart total price
double getCartTotal() {
  return getCart().fold(0, (total, product) => total + product.price);
}

/// add to Cart
void addToCart(int productId) {
  products.firstWhere((product) => product.id == productId).inCart = true;
  Fluttertoast.showToast(msg: 'Item added to Cart');
}

/// remove from Cart
void removeFromCart(int productId) {
  products.firstWhere((element) => element.id == productId).inCart = false;
}

/// clear cart
void clearCart() {
  products.forEach((product) => product.inCart = false);
  Fluttertoast.showToast(msg: 'CartList cleared');
}
