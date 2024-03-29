import 'package:banao/Lessons.dart';
import 'package:banao/Rectangle.dart';
import 'package:banao/event.dart';
import 'package:banao/program.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

final controller = OnboardingItems();
final controllers = Events();
final controllerss = you();
final pageController = PageController();

//late final bool isActive;

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
          // mainAxisAlignment: MainAxisAlignment.start,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Programs for you",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lora(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your button onPressed logic here
                      print('Button pressed');
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Veiw all',
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        SizedBox(width: 8), // Add space between text and icon
                        Icon(Icons.arrow_forward,
                            color: Color.fromARGB(255, 0, 0, 0)),
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
                      width: MediaQuery.of(context)
                          .size
                          .width, // Adjust the width as needed
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          mainAxisExtent: 360,
                        ),
                        itemCount: controller.items.length,
                        itemBuilder: (context, index) {
                          return Container(
                            //height: 200,
                            width:
                                200, // Adjust the width as per your requirement
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(235, 237, 240, 1)),
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
                                    controller.items[index].image,
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.items[index].title,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(89, 139, 237, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        controller.items[index].description,
                                        style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        controller.items[index].text,
                                        style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  TextButton(
                    onPressed: () {
                      // Add your button onPressed logic here
                      print('Button pressed');
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Veiw all',
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        SizedBox(width: 8), // Add space between text and icon
                        Icon(Icons.arrow_forward,
                            color: Color.fromARGB(255, 0, 0, 0)),
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
                      width: MediaQuery.of(context)
                          .size
                          .width, // Adjust the width as needed
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          mainAxisExtent: 360,
                        ),
                        itemCount: controllers.item.length,
                        itemBuilder: (context, index) {
                          return Container(
                            //height: 200,
                            width:
                                200, // Adjust the width as per your requirement
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(235, 237, 240, 1)),
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
                                    controllers.item[index].image,
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controllers.item[index].title,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(89, 139, 237, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        controllers.item[index].description,
                                        style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controllers.item[index].text,
                                            style: const TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
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
                                                        89, 139, 237, 1))),
                                          )
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Lessons for you",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lora(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your button onPressed logic here
                      print('Button pressed');
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Veiw all',
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        SizedBox(width: 8), // Add space between text and icon
                        Icon(Icons.arrow_forward,
                            color: Color.fromARGB(255, 0, 0, 0)),
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
                      width: MediaQuery.of(context)
                          .size
                          .width, // Adjust the width as needed
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          mainAxisExtent: 360,
                        ),
                        itemCount: controllerss.itemss.length,
                        itemBuilder: (context, index) {
                          return Container(
                            //height: 200,
                            width:
                                200, // Adjust the width as per your requirement
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(235, 237, 240, 1)),
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
                                    controllerss.itemss[index].image,
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controllers.item[index].title,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(89, 139, 237, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        controllerss.itemss[index].description,
                                        style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controllerss.itemss[index].text,
                                            style: const TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const Icon(CupertinoIcons.padlock)
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
            const SizedBox(
              height: 30,
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
