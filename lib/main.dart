import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_finder/logic/cubits/bogey/bogey_cubit.dart';
import 'package:seat_finder/presentation/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BogeyCubit>(
            create: (context) => BogeyCubit(),
            lazy: false,
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Seat Finder',
          //Generate theme from color

          home: SeatFinder(),
        ));
  }
}

class SeatFinder extends StatefulWidget {
  const SeatFinder({super.key});

  @override
  State<SeatFinder> createState() => _SeatFinderState();
}

class _SeatFinderState extends State<SeatFinder> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
