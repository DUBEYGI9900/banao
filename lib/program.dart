

class Programs {
  final String title;
  final String description;
  final String image;
  final String text;
  // final String? icon; // Optional icon
  // final String? button; // Optional button

  Programs({
    required this.title,
    required this.description,
    required this.image,
    required this.text,
    // this.icon, // Optional icon
    // this.button, // Optional button
  });
}

class OnboardingItems {
  List<Programs> items = [
    Programs(
      title: "LIFESTYLE",
      description: "A complete guide for your new born baby",
      image: "assets/images/Annotation1.jpg",
      text: "16 lessons",
     // Example of how to add a button
    ),
    Programs(
      title: "WORKING PARENTS",
      description: "Understanding of human behaviour",
      image: "assets/images/Annotation2.jpg",
      text: "12 lessons",
      // You can choose not to include icon and button for this item
    ),
  ];

}

