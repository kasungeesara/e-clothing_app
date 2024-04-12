import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key, required this.price, required this.productName});

  final double price;
  final String productName;

  @override
  // ignore: library_private_types_in_public_api
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<CartItem> cartItems = [];
  String selectedPaymentMethod = 'Credit/Debit Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.productName,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(cartItems[index].name),
                  subtitle: Text('\$${cartItems[index].price}'),
                );
              },
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Shipping Address',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Postal Code',
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            DropdownButtonFormField(
              value: selectedPaymentMethod,
              items: ['Credit/Debit Card', 'Cash on Delivery', 'PayPal']
                  .map((method) {
                return DropdownMenuItem(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
            const SizedBox(height: 20.0),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Order Placed'),
                      content: const Text(
                          'Your order has been successfully placed.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Place Order',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Text(
                'Total: LKR. ${widget.price}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Me tika Data Model file ekt add kragnna!
class CartItem {
  final String name;
  final double price;

  CartItem({required this.name, required this.price});
}
