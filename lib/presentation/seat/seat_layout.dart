import 'package:flutter/material.dart';
import 'package:seat_finder/presentation/seat/seat.dart';

class SeatLayout extends StatefulWidget {
  final int i;

  const SeatLayout(this.i, {Key? key}) : super(key: key);

  @override
  State<SeatLayout> createState() => _SeatState();
}

class _SeatState extends State<SeatLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (MediaQuery.of(context).size.width < 400) {
        return SizedBox(
          height: 55,
          width: 55,
          child:
              Padding(padding: const EdgeInsets.all(1), child: Seat(widget.i)),
        );
      } else if (MediaQuery.of(context).size.width < 600) {
        return SizedBox(
          height: 80,
          width: 80,
          child:
              Padding(padding: const EdgeInsets.all(1), child: Seat(widget.i)),
        );
      } else if (MediaQuery.of(context).size.width < 800) {
        return SizedBox(
          height: 130,
          width: 130,
          child:
              Padding(padding: const EdgeInsets.all(1), child: Seat(widget.i)),
        );
      } else if (MediaQuery.of(context).size.width < 1200) {
        return SizedBox(
          height: 185,
          width: 185,
          child:
              Padding(padding: const EdgeInsets.all(1), child: Seat(widget.i)),
        );
      } else {
        return SizedBox(
          height: 280,
          width: 280,
          child:
              Padding(padding: const EdgeInsets.all(1), child: Seat(widget.i)),
        );
      }
    });
  }
}
