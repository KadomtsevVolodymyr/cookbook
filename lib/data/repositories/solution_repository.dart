import 'package:balancebyte/data/datasource/local/facade/solution_storage_interface.dart';
import 'package:balancebyte/domain/repositories/solution_repository_interface.dart';

class SolutionRepository implements ISolutionRepository {
  SolutionRepository({
    required ISolutionStorage storage,
  }) : _storage = storage;

  final ISolutionStorage _storage;

  @override
  Future<int?> getTheme() => _storage.getTheme();

  @override
  Future<String?> getLocale() => _storage.getLocale();
}
