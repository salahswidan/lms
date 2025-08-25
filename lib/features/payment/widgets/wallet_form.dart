import 'package:flutter/material.dart';
import '../cubit/payment_cubit.dart';

class WalletForm extends StatelessWidget {
  const WalletForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = PaymentCubit.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Mobile Wallet Details",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          children: [
            DropdownButton<String>(
              value: cubit.selectedWalletPrefix,
              items: ["010", "011", "012", "015"]
                  .map((prefix) =>
                      DropdownMenuItem(value: prefix, child: Text(prefix)))
                  .toList(),
              onChanged: (value) => cubit.changeWalletPrefix(value!),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: cubit.phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter phone number";
                  }
                  if (value.length != 8) {
                    return "Phone must be 11 digits (after prefix)";
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
