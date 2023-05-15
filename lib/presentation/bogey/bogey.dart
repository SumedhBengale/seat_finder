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
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Compartment(index);
              },
              itemCount: state.totalCompartments,
            );
          } else if (state is BogeyError) {
            return Scaffold(
              body: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Compartment(index);
                },
                itemCount: state.totalCompartments,
              ),
              bottomSheet: Container(
                decoration: const BoxDecoration(
                    color: Color(0xff0096ff),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: state.error ? 50 : 5,
                width: double.infinity,
                child: Center(
                  child: Text(
                    state.errorMessage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
