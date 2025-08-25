import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/check_out_cubit.dart';

class CouponField extends StatelessWidget {
  final TextEditingController controller;
  const CouponField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "Enter Coupon Code",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            context.read<CheckoutCubit>().applyCoupon(controller.text.trim());
          },
          child: Text(
            "Apply",
            style: TextStyle(
              color:
                  Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
