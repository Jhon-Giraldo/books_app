import '../models/books.dart';
import '../models/gateway/books_gateway.dart';

class SearchBooksUseCase {
  final BooksGateway _booksGateway;

  SearchBooksUseCase(this._booksGateway);

  Future<List<BooksDetail>> getAllBooks() => _booksGateway.getBooks(null);
  Future<List<BooksDetail>> searchBooks(String query) =>
      _booksGateway.getBooks(query);
}
