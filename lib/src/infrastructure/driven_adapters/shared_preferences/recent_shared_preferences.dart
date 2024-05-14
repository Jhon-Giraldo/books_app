import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/models/gateway/recent_searchs_gateway.dart';

class RecentSearchesSharedPreferences implements RecentSearchesGateway {
  @override
  Future<void> storeRecentSearch(String search) async {
    final prefs = await SharedPreferences.getInstance();
    final recentSearches = await getRecentSearches();
    recentSearches.remove(search);
    recentSearches.insert(0, search);
    while (recentSearches.length > 5) {
      recentSearches.removeLast();
    }
    await prefs.setStringList('recentSearches', recentSearches);
  }

  @override
  Future<List<String>> getRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('recentSearches') ?? [];
  }
}
