abstract interface class ISolutionRepository {
  Future<int?> getTheme();
  Future<String?> getLocale();
}
