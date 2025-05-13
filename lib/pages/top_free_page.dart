import 'package:flutter/material.dart';
import '../service/book_service.dart';
import '../models/book_model.dart';
import 'book_detail_page.dart';

class TopFreePage extends StatelessWidget {
  final bookService = BookService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Book>>(
      stream: bookService.getBooks(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        final books = snapshot.data!;
        return GridView.builder(
          padding: EdgeInsets.all(16),
          itemCount: books.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final book = books[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BookDetailPage(book: book)),
                );
              },
              child: Card(
                child: Column(
                  children: [
                    Image.network(book.coverUrl, height: 120),
                    Text(
                      book.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(book.price == 'FREE' ? 'FREE' : '\$${book.price}'),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
