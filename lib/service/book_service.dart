import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/book_model.dart';

class BookService {
  final CollectionReference booksRef = FirebaseFirestore.instance.collection(
    'books',
  );

  Future<void> addBook(Book book) async {
    await booksRef.add(book.toMap());
  }

  Future<void> updateBook(String id, Book book) async {
    await booksRef.doc(id).update(book.toMap());
  }

  Future<void> deleteBook(String id) async {
    await booksRef.doc(id).delete();
  }

  Stream<List<Book>> getBooks() {
    return booksRef.snapshots().map(
      (snapshot) =>
          snapshot.docs
              .map(
                (doc) =>
                    Book.fromMap(doc.data() as Map<String, dynamic>, doc.id),
              )
              .toList(),
    );
  }
}
