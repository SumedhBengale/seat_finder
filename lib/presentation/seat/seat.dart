import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_finder/logic/cubits/bogey/bogey_cubit.dart';

class Seat extends StatefulWidget {
  final int i;

  const Seat(this.i, {Key? key}) : super(key: key);

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BogeyCubit, BogeyState>(
      builder: (context, state) {
        return Container(
            decoration: BoxDecoration(
              //Hex color value
              color: context.read<BogeyCubit>().selectedSeats[widget.i]!
                  ? const Color(0xff0096ff)
                  : const Color(0xFFCEEAFF),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.i.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        color:
                            context.read<BogeyCubit>().selectedSeats[widget.i]!
                                ? Colors.white
                                : const Color(0xff367fd2),
                        fontWeight: FontWeight.w500)),
                BlocBuilder<BogeyCubit, BogeyState>(
                  builder: (context, state) {
                    if (widget.i % 8 == 0) {
                      return Text(context.read<BogeyCubit>().berths[8]!,
                          style: TextStyle(
                              fontSize: 10,
                              color: context
                                      .read<BogeyCubit>()
                                      .selectedSeats[widget.i]!
                                  ? Colors.white
                                  : const Color(0xff367fd2)));
                    } else {
                      return Text(
                          context.read<BogeyCubit>().berths[widget.i % 8]!,
                          style: TextStyle(
                              fontSize: 10,
                              color: context
                                      .read<BogeyCubit>()
                                      .selectedSeats[widget.i]!
                                  ? Colors.white
                                  : const Color(0xff367fd2)));
                    }
                  },
                )
              ],
            )));
      },
    );
  }
}
