import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_finder/logic/cubits/bogey/bogey_cubit.dart';
import 'package:seat_finder/presentation/compartment/compartment.dart';

class Bogey extends StatelessWidget {
  const Bogey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BogeyCubit, BogeyState>(
        builder: (context, state) {
          if (state is BogeyInitial) {
            context.read<BogeyCubit>().getBogeyLayoutData();
            return const Center(child: CircularProgressIndicator());
          } else if (state is BogeyLayoutData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Compartment(index);
              },
              itemCount: state.totalCompartments,
            );
          } else {
            return const Text('Error');
          }
        },
      ),
    );
  }
}
