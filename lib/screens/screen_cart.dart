import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iide_flutter_test/core/helpers.dart';
import 'package:iide_flutter_test/db_functions/db_functions.dart';

import '../models/product.dart';
import '../widgets/produc_tile.dart';

class ScreenCart extends StatefulWidget {
  const ScreenCart({Key? key}) : super(key: key);

  @override
  State<ScreenCart> createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  @override
  Widget build(BuildContext context) {
    var cartItems = getCart();
    var total = getCartTotal();
    if (cartItems.isEmpty) {
      Fluttertoast.showToast(msg: 'Cart is empty');
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Ur Cart is Empty.\nAdd some products to your cart.\n",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              CupertinoButton.filled(
                  child: const Text('Go to Products Page'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  }),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        actions: [
          // clear card button
          TextButton.icon(
            label: const Text(
              'Clear Cart',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.clear_all_rounded,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              clearCart();
              Fluttertoast.showToast(msg: 'CartList cleared');
              setState(() {});
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10).copyWith(bottom: 35),
        child: ListView.separated(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return ProductTile(
              product: cartItems[index],
              showDeleteButton: true,
              onTapDelete: () {
                removeFromCart(cartItems[index].id);

                setState(() {
                  // total -= cartItems[index].price;
                });
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: PhysicalModel(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${cartItems.length} Items in Cart',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Text(
                'SubTotal : \$${total.toStringAsPrecision(4)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
