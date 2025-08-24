
import 'package:bloc/bloc.dart';
import 'check_out_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(List<Map<String, dynamic>> courses)
      : super(CheckoutState(courses: courses, discountPercent: 0));

  void applyCoupon(String code) {
    int? percent = int.tryParse(code);
    if (percent != null && percent > 0 && percent < 100) {
      emit(state.copyWith(discountPercent: percent / 100));
    } else {
      emit(state.copyWith(discountPercent: 0));
    }
  }
}
