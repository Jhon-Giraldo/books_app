import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/books.dart';
import '../../providers/swiper_index.dart';
import 'book_image_cover.dart';
import 'book_information.dart';

class BookSwiper extends StatelessWidget {
  final List<BooksDetail> books;

  const BookSwiper({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Consumer<SwiperIndex>(
      builder: (context, swiperIndex, child) => Swiper(
        index: swiperIndex.currentIndex,
        onIndexChanged: (index) {
          swiperIndex.currentIndex = index;
        },
        itemCount: books.length,
        layout: SwiperLayout.DEFAULT,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              children: [
                BookImageCover(
                  books: books,
                  index: index,
                ),
                BookInformation(
                  books: books,
                  index: index,
                ),
              ],
            ),
          );
        },
        onTap: (int index) {
          Navigator.pushNamed(
            context,
            'detailsScreen',
            arguments: books[index],
          );
        },
      ),
    );
  }
}
