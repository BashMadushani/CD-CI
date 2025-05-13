import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../service/book_service.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;
  final bookService = BookService();

  BookDetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await bookService.deleteBook(book.id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(book.coverUrl, height: 200),
            SizedBox(height: 10),
            Text(
              book.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("by ${book.author}"),
            Text("Category: ${book.category}"),
            Text("Price: ${book.price}"),
          ],
        ),
      ),
    );
  }
}
