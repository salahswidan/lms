import 'package:flutter/material.dart';
import '../cubit/payment_cubit.dart';

class CardForm extends StatelessWidget {
  const CardForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = PaymentCubit.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${cubit.selectedMethod!} Details",
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          controller: cubit.cardNumberController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Card Number",
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Enter card number";
            }
            if (value.length != 16) {
              return "Card number must be 16 digits";
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: cubit.expiryController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: "Expiry Date (MM/YY)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter expiry date";
                  }
                  final regex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
                  if (!regex.hasMatch(value)) {
                    return "Invalid format (MM/YY)";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: cubit.cvvController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "CVV",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter CVV";
                  }
                  if (value.length != 3) {
                    return "CVV must be 3 digits";
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
