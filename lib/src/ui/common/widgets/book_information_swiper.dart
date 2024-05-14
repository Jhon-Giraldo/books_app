import 'package:books_app/src/domain/models/books.dart';
import 'package:books_app/src/ui/providers/swiper_index.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'book_information.dart';

class BookInformationSwiper extends StatelessWidget {
  final List<BooksDetail> books;

  const BookInformationSwiper({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Consumer<SwiperIndex>(
      builder: (context, swiperIndex, child) => Swiper(
        index: swiperIndex.currentIndex,
        onIndexChanged: (index) {
          swiperIndex.currentIndex = index;
        },
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookInformation(
            books: books,
            index: index,
          );
        },
        onTap: (int index) {
          Navigator.pushNamed(context, 'detailsScreen',
              arguments: books[index]);
        },
      ),
    );
  }
}
