import 'package:books_app/src/domain/models/books.dart';
import 'package:books_app/src/domain/models/gateway/books_gateway.dart';

class NewBooksUseCase {
  final BooksGateway _booksGateway;

  NewBooksUseCase(this._booksGateway);

  Future<List<BooksDetail>> getAllBooks() => _booksGateway.getBooks(null);
}
