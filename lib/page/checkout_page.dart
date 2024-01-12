import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late double subtotal;
  String selectedPaymentMethod = "";
  bool isPaymentMethodSelected = false;

  void selectPaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method;
      isPaymentMethodSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    subtotal = context.watch<CartProvider>().getTotalPrice();
    double tva = subtotal * 0.20;
    double total = subtotal + tva;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finalisation de la commande'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20.0),
          Card(
            child: ListTile(
              title: const Text(
                'Récapitulatif de votre commande',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(""),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Sous-total"),
                      Text("${subtotal.toStringAsFixed(2)} €"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("TVA ( 20% )"),
                      Text("${tva.toStringAsFixed(2)} €"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total"),
                      Text("${total.toStringAsFixed(2)} €"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            "Adresse de livraison",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 16.0),
          const Card(
            child: ListTile(
              title: Text('John Doe'),
              subtitle: Text('1 rue de la Paix, 75000 Paris'),
              trailing: Icon(Icons.edit),
              onTap: null,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            "Méthode de paiement",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                PaymentMethodWidget(
                  onSelectPaymentMethod: selectPaymentMethod,
                  methodSelected: selectedPaymentMethod,
                ),
                const SizedBox(height: 50),
                const Text(
                    "En cliquant sur \"Confirmer l'achat\", vous acceptez les conditions générales de vente."),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: isPaymentMethodSelected
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Votre commande est validée, vous avez payé avec ${selectedPaymentMethod}'),
                            ),
                          );
                        }
                      : null,
                  child: const Text('Confirmer l\'achat',
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  final Function(String) onSelectPaymentMethod;
  final String methodSelected;

  PaymentMethodWidget(
      {required this.onSelectPaymentMethod, required this.methodSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PaymentMethodButton(
          method: 'Apple Pay',
          icon: const FaIcon(FontAwesomeIcons.ccApplePay),
          // Add your Apple Pay logo asset
          onSelect: onSelectPaymentMethod,
          isSelected: methodSelected == 'Apple Pay',
        ),
        PaymentMethodButton(
          method: 'Visa',
          icon: const FaIcon(FontAwesomeIcons.ccVisa),
          // Add your Visa logo asset
          onSelect: onSelectPaymentMethod,
          isSelected: methodSelected == 'Visa',
        ),
        PaymentMethodButton(
          method: 'PayPal',
          icon: const FaIcon(FontAwesomeIcons.paypal),
          // Add your PayPal logo asset
          onSelect: onSelectPaymentMethod,
          isSelected: methodSelected == 'PayPal',
        ),
      ],
    );
  }
}

class PaymentMethodButton extends StatelessWidget {
  final String method;
  final FaIcon icon;
  final Function(String) onSelect;
  final bool isSelected;

  PaymentMethodButton({
    required this.method,
    required this.icon,
    required this.onSelect,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 2 : 0,
      // Mettez en surbrillance si sélectionné
      color: isSelected ? Colors.amber[100] : Colors.white,
      // Changez la couleur de fond si sélectionné
      child: IconButton(
        icon: icon,
        iconSize: 48.0,
        color: isSelected ? Colors.amber : Colors.grey,
        // Changez la couleur de l'icône si sélectionné
        onPressed: () {
          onSelect(method);
        },
      ),
    );
  }
}
