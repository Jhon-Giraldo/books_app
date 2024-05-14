import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/app_colors_config.dart';
import '../../../../config/theme/app_text_style_config.dart';
import '../../../../domain/models/books.dart';
import '../../../../domain/models/gateway/recent_searchs_gateway.dart';
import '../../../../domain/use_cases/search_books_use_case.dart';

class BooksSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar libros';

  @override
  List<Widget>? buildActions(BuildContext context) {
    final recentSearchesGateway = Provider.of<RecentSearchesGateway>(
      context,
      listen: false,
    );

    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          recentSearchesGateway.storeRecentSearch(query);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Por favor ingrese un término de búsqueda ',
            style: AppTextStyleConfig.buttonTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final searchBooksUseCase =
        Provider.of<SearchBooksUseCase>(context, listen: false);

    return FutureBuilder<List<BooksDetail>>(
      future: searchBooksUseCase.searchBooks(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColorsConfig.cardColor1,
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Ha ocurrido un error: ${snapshot.error}'),
          );
        } else if (snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'No se encontraron resultados',
              style: AppTextStyleConfig.buttonTextStyle,
            ),
          );
        } else {
          if (snapshot.data!.isNotEmpty) {
            final books = snapshot.data!;
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return Card(
                  color: AppColorsConfig.cardColor1,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Image.network(
                      books[index].image,
                    ),
                    title: Text(
                      books[index].title,
                      style: AppTextStyleConfig.titleStyle,
                    ),
                    subtitle: Text(
                      books[index].subtitle.isNotEmpty
                          ? books[index].subtitle
                          : 'Sin descripción',
                      style: AppTextStyleConfig.subtitleStyle,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'detailsScreen',
                        arguments: books[index],
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No se encontraron resultados'));
          }
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu_book_rounded,
                size: 200,
                color: AppColorsConfig.primaryColor,
              ),
              Text('Encuentra el libro que necesites',
                  style: AppTextStyleConfig.buttonTextStyle),
            ],
          ),
        ),
      );
    }
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColorsConfig.cardColor1,
            ),
          ),
        ],
      ),
    );
  }
}
