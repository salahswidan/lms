import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/check_out_cubit.dart';
import '../cubit/check_out_state.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Text(
          "Total: \$${state.totalPrice.toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        );
      },
    );
  }
}