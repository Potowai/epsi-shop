import 'package:epsi_shop/bo/articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class DetailPage extends StatelessWidget {
  final Articles article;

  const DetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Epsi Shop',
          ),
        ),
        body: Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                article.nom,
                style: const TextStyle(
                    fontSize: 24), // Replace with your theme if necessary
              ),
              const SizedBox(height: 10),
              Image.network(
                article.image,
                width: 250,
                height: 250,
              ),
              const Text(
                'Description:',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                article.description,
                style: const TextStyle(
                    fontSize: 16), // Replace with your theme if necessary
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${article.prix}€',
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 24), // Replace with your theme if necessary
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: article.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (double value) {},
                        // Replace with your theme if necessary
                      ),
                      Text('${article.countRating} avis'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              FilledButton(
                  onPressed: () => {
                        context.read<CartProvider>().add(article),
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Article ajouté au panier'),
                            duration: Duration(seconds: 1),
                          ),
                        ),
                      },
                  child: const Icon(Icons.add_shopping_cart)),
            ],
          ),
        ));
  }
}
