class Temperatures {
    String requestId;
    List<Item> items;
    int count;
    String anyKey;

    Temperatures({
        required this.requestId,
        required this.items,
        required this.count,
        required this.anyKey,
    });

}

class Item {
    DateTime createdAt;
    String name;
    String category;
    int lesson;
    String id;

    Item({
        required this.createdAt,
        required this.name,
        required this.category,
        required this.lesson,
        required this.id,
    });

}





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
