import 'package:books_app/src/domain/use_cases/new_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/providers/providers.dart';
import '../config/routes/app_routes.dart';
import '../config/theme/theme_config.dart';
import '../domain/models/books.dart';
import '../ui/screens/details_screen.dart';
import '../ui/screens/new_books_screen.dart';
import '../ui/screens/onboarding_screen.dart';

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Books App',
        theme: ThemeConfig.getThemeData(),
        initialRoute: AppRoutes.onBoardingScreen,
        routes: {
          AppRoutes.onBoardingScreen: (context) => const OnboardingScreen(),
        },
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == AppRoutes.newBooksScreen) {
            return MaterialPageRoute(
              builder: (context) => NewBooksScreen(
                booksDetailList: Provider.of<NewBooksUseCase>(
                  context,
                  listen: false,
                ).getAllBooks(),
              ),
            );
          }
          if (settings.name == AppRoutes.detailsScreen) {
            final booksDetail = settings.arguments as BooksDetail;
            return MaterialPageRoute(
              builder: (context) => DetailsScreen(
                booksDetail: booksDetail,
              ),
            );
          }
          return null;
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          );
        },
      ),
    );
  }
}
