import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/check_out_cubit.dart';
import '../cubit/check_out_state.dart';
import '../widgets/check_out_button.dart';
import '../widgets/coupon_input.dart';
import '../widgets/course_item.dart';
import '../widgets/total_price.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courses;

  const CheckoutScreen({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    final couponController = TextEditingController();

    return BlocProvider(
      create: (_) => CheckoutCubit(courses),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Checkout"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your Courses:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              Expanded(
                child: BlocBuilder<CheckoutCubit, CheckoutState>(
                  builder: (context, state) {
                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: state.courses.length,
                      itemBuilder: (context, index) =>
                          CourseItem(course: state.courses[index]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              CouponField(controller: couponController),
              const SizedBox(height: 20),
              const TotalPriceWidget(),
              const SizedBox(height: 20),
              const CheckoutButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
