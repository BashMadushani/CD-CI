class Book {
  String id;
  String title;
  String author;
  String category;
  String coverUrl;
  String price;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.coverUrl,
    required this.price,
  });

  factory Book.fromMap(Map<String, dynamic> data, String id) {
    return Book(
      id: id,
      title: data['title'] ?? '',
      author: data['author'] ?? '',
      category: data['category'] ?? '',
      coverUrl: data['coverUrl'] ?? '',
      price: data['price'] ?? 'FREE',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'category': category,
      'coverUrl': coverUrl,
      'price': price,
    };
  }
}
