import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/payment_cubit.dart';
import '../widgets/card_form.dart';
import '../widgets/payment_method_selector.dart';
import '../widgets/wallet_form.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if (state is PaymentSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final cubit = PaymentCubit.of(context);

          return Scaffold(
            appBar: AppBar(
              iconTheme: Theme.of(context).iconTheme,
              title: Text(
                "Payment",
                style: TextStyle(
                  fontSize: 20,
                  color:
                      Theme.of(context).textTheme.bodyMedium?.color ??
                      Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      const Text(
                        "Select Payment Method",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      const PaymentMethodSelector(),
                      const SizedBox(height: 20),

                      if (cubit.selectedMethod == "Mobile Wallet")
                        const WalletForm(),
                      if (cubit.selectedMethod == "Visa" ||
                          cubit.selectedMethod == "MasterCard")
                        const CardForm(),

                      const Spacer(),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              cubit.selectedMethod == null
                                  ? Colors.grey
                                  : Colors.blue,
                            ),
                          ),
                          onPressed: cubit.selectedMethod == null
                              ? null
                              : () => cubit.pay(),
                          child: const Text("Pay Now"),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
