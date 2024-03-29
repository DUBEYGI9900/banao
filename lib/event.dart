

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Items {
  DateTime createdAt;
  String name;
  int duration;
  String category;
  bool locked;
  String id;

  Items({
    required this.createdAt,
    required this.name,
    required this.duration,
    required this.category,
    required this.locked,
    required this.id,
  });
}

class events extends StatefulWidget {
  const events({Key? key}) : super(key: key);

  @override
  _eventsState createState() => _eventsState();
}

class _eventsState extends State<events> {
  List<Items> itemsList = [];
  bool showAllItems = false;

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        itemsList = (jsonData['items'] as List)
            .map((item) => Items(
          createdAt: DateTime.parse(item['createdAt']),
          name: item['name'],
          duration: item['duration'],
          category: item['category'],
          locked: item['locked'],
          id: item['id'],
        ))
            .toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Events and experiences",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lora(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 100,),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showAllItems = !showAllItems;
                      });
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View all',
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Color.fromARGB(255, 0, 0, 0)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      mainAxisExtent: 360,
                    ),
                    itemCount: showAllItems ? itemsList.length : (itemsList.length > 2 ? 2 : itemsList.length),
                    itemBuilder: (context, index) {
                      final item = itemsList[index];
                      return Container(
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(235, 237, 240, 1),
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: Image.asset(
                                "assets/images/events1.jpg",
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(89, 139, 237, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    item.category,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
       Text(
  '${item.createdAt}', // Display first 5 letters if available
  style: const TextStyle(
    color: Color.fromARGB(255, 0, 0, 0), // Set text color
    fontSize: 12, // Set font size
    fontWeight: FontWeight.w500, // Set font weight
  ), // Style the text
), // Show limited text
 // Show first 5 letters

                                      ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              //primary:
                                              // onPrimary: Colors.red,
                                              side: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      89, 139, 237, 1)),
                                            ),
                                            child: const Text("Book",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        89, 139, 237, 1))),)
                                      // if (item.locked) // Display lock icon only if item is locked
                                      //   Icon(CupertinoIcons.padlock)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
