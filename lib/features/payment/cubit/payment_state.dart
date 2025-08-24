part of 'payment_cubit.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentMethodSelected extends PaymentState {
  final String method;
  PaymentMethodSelected(this.method);
}

class WalletPrefixChanged extends PaymentState {
  final String prefix;
  WalletPrefixChanged(this.prefix);
}

class PaymentSuccess extends PaymentState {
  final String message;
  PaymentSuccess(this.message);
}
