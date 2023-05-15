import 'package:flutter/material.dart';

class Seat extends StatefulWidget {
  final int i;

  const Seat(this.i, {Key? key}) : super(key: key);

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.height / 12,
      child: Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
              decoration: const BoxDecoration(
                //Hex color value
                color: Color(0xFFCEEAFF),
              ),
              child: Center(
                  child: Text(widget.i.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF80CAFF),
                          fontWeight: FontWeight.w500))))),
    );
  }
}
