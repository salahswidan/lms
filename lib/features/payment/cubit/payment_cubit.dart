import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  static PaymentCubit of(BuildContext context) =>
      BlocProvider.of<PaymentCubit>(context);

  String? selectedMethod;
  String selectedWalletPrefix = "010";

  final phoneController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void selectMethod(String method) {
    selectedMethod = method;
    emit(PaymentMethodSelected(method));
  }

  void changeWalletPrefix(String prefix) {
    selectedWalletPrefix = prefix;
    emit(WalletPrefixChanged(prefix));
  }

  void pay() {
    if (!formKey.currentState!.validate()) return;

    if (selectedMethod == "Mobile Wallet") {
      emit(PaymentSuccess(
          "Pay with Wallet: $selectedWalletPrefix${phoneController.text}"));
    } else {
      emit(PaymentSuccess(
          "Pay with $selectedMethod - Card: ${cardNumberController.text}"));
    }
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    return super.close();
  }
}
