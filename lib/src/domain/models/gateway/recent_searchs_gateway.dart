abstract class RecentSearchesGateway {
  Future<void> storeRecentSearch(String search);
  Future<List<String>> getRecentSearches();
}
