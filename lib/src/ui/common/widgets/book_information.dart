import 'package:flutter/material.dart';

import '../../../config/theme/app_text_style_config.dart';
import '../../../domain/models/books.dart';

class BookInformation extends StatelessWidget {
  const BookInformation({
    super.key,
    required this.books,
    required this.index,
  });

  final List<BooksDetail> books;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              books[index].title,
              style: AppTextStyleConfig.titleStyle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
            child: Text(
              books[index].subtitle,
              style: AppTextStyleConfig.subtitleStyle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),
        ),
      ],
    );
  }
}
