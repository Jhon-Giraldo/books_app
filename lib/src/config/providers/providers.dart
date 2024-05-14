import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../domain/models/gateway/books_gateway.dart';
import '../../domain/models/gateway/recent_searchs_gateway.dart';
import '../../domain/use_cases/new_books_use_case.dart';
import '../../domain/use_cases/search_books_use_case.dart';
import '../../infrastructure/driven_adapters/api/books_api/new_books_api.dart';
import '../../infrastructure/driven_adapters/api/books_api/search_books_api.dart';
import '../../infrastructure/driven_adapters/shared_preferences/recent_shared_preferences.dart';
import '../../ui/providers/swiper_index.dart';

List<SingleChildWidget> providers = [
  Provider<SearchBooksGateway>(
    create: (_) => SearchBooksApi(),
  ),
  Provider<NewBooksGateway>(
    create: (_) => NewBooksApi(),
  ),
  ProxyProvider<SearchBooksGateway, SearchBooksUseCase>(
    update: (_, searchBooksGateway, __) =>
        SearchBooksUseCase(searchBooksGateway),
  ),
  ProxyProvider<NewBooksGateway, NewBooksUseCase>(
    update: (_, newBooksGateway, __) => NewBooksUseCase(newBooksGateway),
  ),
  ChangeNotifierProvider(
    create: (_) => SwiperIndex(),
  ),
  Provider<RecentSearchesGateway>(
    create: (_) => RecentSearchesSharedPreferences(),
  ),
];
