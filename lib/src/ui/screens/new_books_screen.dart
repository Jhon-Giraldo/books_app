import 'package:flutter/material.dart';

import '../../config/theme/app_colors_config.dart';
import '../../config/theme/app_text_style_config.dart';
import '../../domain/models/books.dart';
import '../common/widgets/book_swiper.dart';
import '../common/widgets/search_delegate/books_search_delegate.dart';

class NewBooksScreen extends StatelessWidget {
  final Future<List<BooksDetail>> booksDetailList;

  const NewBooksScreen({
    super.key,
    required this.booksDetailList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/newsBook.avif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                title: Text(
                  'Librería Antioquia',
                  style: AppTextStyleConfig.titleStyle,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search,
                        color: AppColorsConfig.subtittleColor),
                    onPressed: () => showSearch(
                      context: context,
                      delegate: BooksSearchDelegate(),
                    ),
                  )
                ],
              ),
              Expanded(
                child: FutureBuilder<List<BooksDetail>>(
                  future: booksDetailList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Center(
                        child: BookSwiper(
                          books: snapshot.data!,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColorsConfig.cardColor1,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
