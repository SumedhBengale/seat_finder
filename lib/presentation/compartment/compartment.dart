import 'package:flutter/material.dart';
import 'package:seat_finder/presentation/seat/seat_layout.dart';

class Compartment extends StatefulWidget {
  final int cIndex;
  const Compartment(this.cIndex, {Key? key}) : super(key: key);

  @override
  State<Compartment> createState() => _CompartmentState();
}

class _CompartmentState extends State<Compartment> {
  @override
  Widget build(BuildContext context) {
    //Return a placeholder with rectangular aspect ratio
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
            //Align children to extreme ends
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Stack(
                      children: [
                        // The widget to be bordered
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: Row(children: [
                              SeatLayout(widget.cIndex * 8 + 1),
                              SeatLayout(widget.cIndex * 8 + 2),
                              SeatLayout(widget.cIndex * 8 + 3)
                            ]),
                          ),
                        ),
                        // The border container
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: MediaQuery.of(context).size.height / 24,
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color(0xFF80CAFF),
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                                right: BorderSide(
                                  color: Color(0xFF80CAFF),
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                                left: BorderSide(
                                  color: Color(0xFF80CAFF),
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Stack(
                      children: [
                        // The widget to be bordered
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: Row(children: [
                              SeatLayout(widget.cIndex * 8 + 4),
                              SeatLayout(widget.cIndex * 8 + 5),
                              SeatLayout(widget.cIndex * 8 + 6)
                            ]),
                          ),
                        ),
                        // The border container
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: MediaQuery.of(context).size.height / 24,
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFF80CAFF),
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                                right: BorderSide(
                                  color: Color(0xFF80CAFF),
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                                left: BorderSide(
                                  color: Color(0xFF80CAFF),
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Stack(
                      children: [
                        // The widget to be bordered
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: SeatLayout(widget.cIndex * 8 + 7),
                          ),
                        ),
                        // The border container
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: MediaQuery.of(context).size.height / 24,
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color(0xFF80CAFF),
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                                right: BorderSide(
                                  color: Color(0xFF80CAFF),
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                                left: BorderSide(
                                  color: Color(0xFF80CAFF),
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Stack(
                      children: [
                        // The widget to be bordered
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: SeatLayout(widget.cIndex * 8 + 8),
                          ),
                        ),
                        // The border container
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: MediaQuery.of(context).size.height / 24,
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFF80CAFF),
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                                right: BorderSide(
                                  color: Color(0xFF80CAFF),
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                                left: BorderSide(
                                  color: Color(0xFF80CAFF),
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
