// product list item widget with name and add to cart button

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iide_flutter_test/models/product.dart';

class ProductTile extends StatefulWidget {
  final Product product;
  final bool showDeleteButton;
  final Function()? onTapDelete;
  const ProductTile(
      {Key? key,
      required this.product,
      this.showDeleteButton = false,
      this.onTapDelete})
      : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PhysicalModel(
            color: Colors.white,
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            shadowColor: Colors.blue,
            child: ListTile(
              title: Text(
                widget.product.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text(
                widget.product.description,
                style: const TextStyle(fontStyle: FontStyle.italic),
                maxLines: 1,
              ),
              trailing: GestureDetector(
                onTap: () {
                  widget.product.inCart = !widget.product.inCart;
                  setState(() {});
                },
                child: widget.showDeleteButton
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$${widget.product.price}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: widget.onTapDelete,
                            icon: const Icon(
                              CupertinoIcons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    : Card(
                        elevation: 2,
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // price
                              Text(
                                '\$${widget.product.price}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                widget.product.inCart
                                    ? CupertinoIcons.checkmark_alt
                                    : CupertinoIcons.cart_badge_plus,
                                size: 35,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
