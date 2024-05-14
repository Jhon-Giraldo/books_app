import 'package:flutter/material.dart';

import '../../../domain/models/books.dart';

class BookImageCover extends StatelessWidget {
  const BookImageCover({
    super.key,
    required this.books,
    required this.index,
  });

  final List<BooksDetail> books;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: Image.network(
        books[index].image,
        fit: BoxFit.fill,
      ),
    );
  }
}
