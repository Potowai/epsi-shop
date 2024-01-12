import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:epsi_shop/bo/cart.dart';

import '../bo/articles.dart';

class ArticleItemHomeView extends StatelessWidget {
  final List<Articles> articles;

  const ArticleItemHomeView({Key? key, required this.articles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Card(
          child: SizedBox(
            height: 80,
            child: ListTile(
              onTap: () {
                context.go('/detail/', extra: articles[index]);
              },
              leading: Image.network(
                articles[index].image,
                width: 50,
                height: 50,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Text('Failed to load image');
                },
              ),
              title: Text(
                articles[index].nom,
                overflow: TextOverflow.fade,
              ),
              trailing: Text('${articles[index].prix}€',
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
          ),
        );
      },
    );
  }
}

class ArticleItemCartView extends StatelessWidget {
  final List<Articles> articles;

  const ArticleItemCartView({Key? key, required this.articles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Card(
            child: SizedBox(
              height: 80,
              child: ListTile(
                leading: Image.network(
                  articles[index].image,
                  width: 50,
                  height: 50,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Text('Failed to load image');
                  },
                ),
                title: Text(
                  articles[index].nom,
                  overflow: TextOverflow.fade,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        '${(articles[index].prix * articles[index].quantity.toDouble()).toString()}€'),
                    const SizedBox(width: 8),
                    Text('Qty: ${articles[index].quantity}'),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<CartProvider>().remove(articles[index]);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
