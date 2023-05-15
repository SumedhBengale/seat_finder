import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_finder/logic/cubits/bogey/bogey_cubit.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Search box with search button
    return SizedBox(
        height: MediaQuery.of(context).size.height / 12,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Padding(
            padding: const EdgeInsets.all(1),
            child: Container(
                decoration: const BoxDecoration(
                  //Rounded rectangle shape,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  //Hex color value
                  color: Color(0xFFCEEAFF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF80CAFF),
                                fontWeight: FontWeight.w500),
                            hintText: 'Seat number or Berth',
                          ),
                          controller: searchController,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF80CAFF),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        //Button size
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(100, double.infinity)),
                          //Rounded rectangle border
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                          color: Color(0xFF80CAFF)))),
                        ),
                        onPressed: () => context
                            .read<BogeyCubit>()
                            .search(searchController.text),
                        child: const Text(
                          "Search",
                          style: TextStyle(fontSize: 15),
                        )),
                  ],
                ))));
  }
}
