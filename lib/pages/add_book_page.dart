import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../service/book_service.dart';

class AddBookPage extends StatefulWidget {
  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _formKey = GlobalKey<FormState>();
  final bookService = BookService();

  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final categoryController = TextEditingController();
  final coverUrlController = TextEditingController();
  final priceController = TextEditingController();

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final book = Book(
        id: '',
        title: titleController.text,
        author: authorController.text,
        category: categoryController.text,
        coverUrl: coverUrlController.text,
        price: priceController.text,
      );
      await bookService.addBook(book);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Book Added')));
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Book')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: authorController,
                decoration: InputDecoration(labelText: 'Author'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              TextFormField(
                controller: coverUrlController,
                decoration: InputDecoration(labelText: 'Cover Image URL'),
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Price (FREE or amount)',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _submit, child: Text('Add Book')),
            ],
          ),
        ),
      ),
    );
  }
}
