import 'package:epsi_shop/assets/theme_data.dart';
import 'package:epsi_shop/page/about_us_page.dart';
import 'package:epsi_shop/page/cart_page.dart';
import 'package:epsi_shop/page/checkout_page.dart';
import 'package:epsi_shop/page/detail_page.dart';
import 'package:epsi_shop/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'assets/theme_data.dart';
import 'bo/articles.dart';

// GoRouter configuration
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        name: 'home',
        // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
              name: 'cart',
              path: 'cart',
              builder: (context, state) => const CartPage(
                    items: [],
                  )),
          GoRoute(
              name: 'detail',
              path: 'detail',
              builder: (context, state) =>
                  DetailPage(article: state.extra as Articles)),
          GoRoute(
              path: 'about-us',
              name: 'about-us',
              builder: (context, state) => AboutUsPage()),
          GoRoute(
              path: 'checkout',
              name: 'checkout',
              builder: (context, state) {
                return CheckoutPage();
              }),
        ]),
  ],
);

final ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.amber,
  ),
  colorScheme: const ColorScheme.light(primary: Colors.black),
  fontFamily: 'Readex Pro',
  // other light theme settings
);

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(primary: Colors.redAccent),
  fontFamily: 'Readex Pro',
  // other dark theme settings
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  int _selectedIndex = 0; // Current index for BottomNavigationBar

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void changePage(int index, context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/cart');
        break;
      case 2:
        context.go('/about-us');
        break;
      case 3:
        _toggleTheme();
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: myTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      builder: (context, router) {
        return Overlay(
          initialEntries: [
            OverlayEntry(builder: (context) {
              return Scaffold(
                body: router,
                backgroundColor: Colors.blue,
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.amber[800],
                  unselectedItemColor: Colors.grey[600],
                  backgroundColor: Colors.blue,
                  onTap: (currentIndex) {
                    _onItemTapped(currentIndex);
                    changePage(currentIndex, context);
                  },
                  items: [
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart),
                      label: 'Cart',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.info),
                      label: 'About',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(_themeMode == ThemeMode.light
                          ? Icons.light_mode
                          : Icons.dark_mode),
                      label: 'Theme',
                    ),
                  ],
                ),
              );
            })
          ],
        );
      },
    );
  }
}
