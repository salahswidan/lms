import 'package:flutter/material.dart';
import '../cubit/payment_cubit.dart';

class PaymentMethodSelector extends StatefulWidget {
  const PaymentMethodSelector({super.key});

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  final List<Map<String, dynamic>> methods = const [
    {"title": "Mobile Wallet", "icon": Icons.account_balance_wallet},
    {"title": "Visa", "icon": Icons.credit_card},
    {"title": "MasterCard", "icon": Icons.credit_card_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = PaymentCubit.of(context);

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: methods.length,
        itemBuilder: (context, index) {
          final method = methods[index];
          final isSelected = cubit.selectedMethod == method["title"];

          return GestureDetector(
            onTap: () {
              cubit.selectMethod(method["title"]);
              setState(() {});
            },
            child: Container(
              width: 120,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey.shade400,
                  width: 3,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(method["icon"], size: 40, color: Colors.blue),
                  const SizedBox(height: 10),
                  Text(method["title"]),
                  if (isSelected)
                    const Icon(Icons.check_circle, color: Colors.blue),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
