
 class lessons {
  final String title;
  final String description;
  final String image;
  final String text;
  // final String? icon; // Optional icon
  // final String? button; // Optional button

  lessons({
    required this.title,
    required this.description,
    required this.image,
    required this.text,
    // this.icon, // Optional icon
    // this.button, // Optional button
  });
}
 class you {
  List<lessons> itemss = [
    lessons(
      title: "BABYCARE",
      description: "U of human behaviour",
      image: "assets/images/events1.jpg",
      text: "3 min",
     // Example of how to add a button
    ),
    lessons(
      title: "BABYCARE",
      description: "Understanding of human behaviour",
      image: "assets/images/events1.jpg",
      text: "1 min",
     // Example of how to add a button
    ),
  ];

}

