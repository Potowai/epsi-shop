import 'dart:convert';
import 'package:epsi_shop/bo/cart.dart';
import 'package:epsi_shop/page/article_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../bo/articles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initialize your items list here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Epsi Shop '),
        actions: [
          IconButton(
            icon: Badge(
              label: Text('${context.watch<CartProvider>().getNumberItems()}'),
              child: const Icon(Icons.shopping_cart),
            ),
            onPressed: () {
              context.go('/cart');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Articles>>(
        future: fetchArticles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ArticleItemHomeView(articles: snapshot.data!);
          } else {
            return const Center(child: Text("Pas d'articles trouvés"));
          }
        },
      ),
    );
  }

  Future<List<Articles>> fetchArticles() async {
    final response =
        await http.get(Uri.parse('https://fakeapidata.com/products/'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<Articles> items =
          jsonResponse.map((data) => Articles.fromJson(data)).toList();
      return items;
    } else if (response.statusCode == 404) {
      throw Exception('Failed to load articles');
    } else if (response.statusCode == 500) {
      throw Exception('Failed to load articles');
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
