abstract interface class SharedStorageInterface {
  Future<double> getCoinBalance();
  Future<void> setCoinBalance(double value);
  Future<void> clearCoinBalance();
}
