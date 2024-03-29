
import 'package:banao/Lessons.dart';
import 'package:banao/Rectangle.dart';
import 'package:banao/event.dart';
import 'package:banao/program.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.message),
          SizedBox(width: 10),
          Icon(Icons.notifications),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 220,
              color: const Color.fromARGB(255, 238, 243, 253),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment:
                          Alignment.centerLeft, // Aligning text to the left
                      child: Text(
                        "Hello, Priya!",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment:
                          Alignment.centerLeft, // Aligning text to the left
                      child: Text(
                        "What do you wanna learn today?",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TopCategory(
                              icon: Icons.menu_book_rounded, text: "Programs"),
                          SizedBox(
                            width: 20,
                          ),
                          TopCategory(icon: Icons.help, text: "Get help")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TopCategory(icon: Icons.book, text: "Programs"),
                          SizedBox(
                            width: 20,
                          ),
                          TopCategory(
                              icon: CupertinoIcons.chart_bar_square_fill,
                              text: "Get help")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Row(
              children: [
                Expanded(child: Programs())
                // /(child: Programs()),
              ],
            ),
            const Row(
              children: [
                Expanded(child: events())
                // /(child: Programs()),
              ],
            ),
            const Row(
              children: [
                Expanded(child: Lesson())
                // /(child: Programs()),
              ],
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            selectedItemColor: const Color.fromRGBO(89, 139, 237, 1),
            unselectedItemColor: const Color.fromRGBO(109, 116, 122, 1),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (value) {
              // Respond to item press.
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book),
                label: 'Learn',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Hub',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bubble_left),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  // Adjust the radius according to your design
                  backgroundImage: AssetImage(
                    'assets/images/profile.jpg',
                  ), // Replace 'assets/profile_image.png' with your image path
                ),
                label: 'Profile',
              ),
            ],
          ),
          // Additional decoration based on user active status
          Positioned(
            top: 0,
            // bottom: 0,
            left: 10,
            width: 80,
            //right: 0,
            child: Container(
              height: 4,
              width: 5,
              decoration: const BoxDecoration(
                color: Color(0xFF81B4FF),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ],
      ),
  
    );
    
  }
  
}
