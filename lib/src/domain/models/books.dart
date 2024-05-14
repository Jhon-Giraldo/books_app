import 'dart:convert';

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
  final String error;
  final String total;
  final List<BooksDetail> books;
  final String? page;

  Books({
    required this.error,
    required this.total,
    required this.books,
    this.page = '',
  });

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        error: json["error"],
        total: json["total"],
        page: json["page"],
        books: List<BooksDetail>.from(
            json["books"].map((x) => BooksDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "page": page,
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
      };
}

class BooksDetail {
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  BooksDetail({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory BooksDetail.fromJson(Map<String, dynamic> json) => BooksDetail(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "isbn13": isbn13,
        "price": price,
        "image": image,
        "url": url,
      };
}
