import '../books.dart';

abstract class BooksGateway {
  Future<List<BooksDetail>> getBooks(String? query);
}

abstract class SearchBooksGateway extends BooksGateway {
  @override
  Future<List<BooksDetail>> getBooks(String? query);
}

abstract class NewBooksGateway extends BooksGateway {
  @override
  Future<List<BooksDetail>> getBooks(String? query);
}
