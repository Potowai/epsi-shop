import 'package:epsi_shop/bo/articles.dart';
import 'package:epsi_shop/bo/cart.dart';
import 'package:epsi_shop/page/article_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  final List<Articles> items;

  const CartPage({super.key, required this.items});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Initialize your items list here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text(
                'Votre panier',
              ),
            ],
          ),
        ),
        body: Consumer<CartProvider>(
            builder: (BuildContext context, CartProvider cart, Widget? child) {
          return cart.items.isEmpty
              ? const Center(
                  child: Text('No items in cart :/'),
                )
              : Column(
                  children: [
                    ArticleItemCartView(articles: cart.items),
                    const SizedBox(height: 20),
                    Text(
                      'Total: ${cart.getTotalPrice()}€',
                      style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                        onPressed: () {
                          context.go('/checkout');
                        },
                        child: const Text('Checkout')),
                  ],
                );
        }));
  }
}
