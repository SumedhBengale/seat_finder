import 'package:flutter/material.dart';
import 'package:seat_finder/presentation/bogey/bogey.dart';
import 'package:seat_finder/presentation/search/search_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //Make the appbar transparent
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.blue[200],
              fontWeight: FontWeight.w700,
              fontSize: 24),
          title: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('Seat Finder'),
          ),
        ),
        body: const Column(
          children: [SearchBox(), Expanded(child: Bogey())],
        ));
  }
}
