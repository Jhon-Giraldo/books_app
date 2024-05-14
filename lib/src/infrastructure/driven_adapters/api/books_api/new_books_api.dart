import 'package:http/http.dart' as http;

import '../../../../domain/models/books.dart';
import '../../../../domain/models/gateway/books_gateway.dart';
import 'errors/books_api_error.dart';

class NewBooksApi implements NewBooksGateway {
  final String baseUrl = 'https://api.itbook.store/1.0';

  @override
  Future<List<BooksDetail>> getBooks(String? query) async {
    Uri url = Uri.parse('$baseUrl/new');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final books = booksFromJson(response.body);
      final booksDetails = books.books;
      return booksDetails;
    } else {
      throw BooksApiError;
    }
  }
}
