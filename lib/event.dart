
 class experiences {
  final String title;
  final String description;
  final String image;
  final String text;


  experiences({
    required this.title,
    required this.description,
    required this.image,
    required this.text,

  });
}
 class Events {
  List<experiences> item = [
    experiences(
      title: "BABYCARE",
      description: "Understanding of human behaviour",
      image: "assets/images/events1.jpg",
      text: "13 Feb, Sunday",
     // Example of how to add a button
    ),
    experiences(
      title: "BABYCARE",
      description: "Understanding of human behaviour",
      image: "assets/images/events1.jpg",
      text: "13 Feb, Sunday",
     // Example of how to add a button
    ),
  ];

}

