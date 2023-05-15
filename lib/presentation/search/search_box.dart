import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
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
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Search',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF80CAFF),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    ElevatedButton(
                        //Button size
                        style: ButtonStyle(
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
                        onPressed: () {},
                        child: const Text("Search")),
                  ],
                ))));
  }
}
