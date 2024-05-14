import 'package:books_app/src/config/theme/app_colors_config.dart';
import 'package:books_app/src/config/theme/app_text_style_config.dart';
import 'package:books_app/src/domain/models/books.dart';
import 'package:flutter/material.dart';

import '../common/widgets/book_image_cover.dart';

class DetailsScreen extends StatelessWidget {
  final BooksDetail booksDetail;
  final int? index;

  const DetailsScreen({
    super.key,
    required this.booksDetail,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/detailsBook.avif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      title: Text(
                        booksDetail.title,
                        style: AppTextStyleConfig.titleStyle,
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: BookImageCover(
                          books: [booksDetail],
                          index: index!,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      color: AppColorsConfig.whiteColorWithOpacity,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booksDetail.subtitle,
                              style: AppTextStyleConfig.buttonTextStyle,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "ISBN: ${booksDetail.isbn13}",
                              style: AppTextStyleConfig.buttonTextStyle,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Price: ${booksDetail.price}",
                              style: AppTextStyleConfig.buttonTextStyle,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "URL: ${booksDetail.url}",
                              style: AppTextStyleConfig.buttonTextStyle,
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
