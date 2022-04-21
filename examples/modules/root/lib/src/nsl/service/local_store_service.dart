import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'hive/hive_local_storage_service.dart';

var localStorageServiceProvider = Provider<LocalStorageService>((ref) =>
    HiveLocalStorageService(
        boxName: 'name', pathFuture: path.getApplicationDocumentsDirectory()));

abstract class LocalStorageService {
  void write({required String key, required String value});

  dynamic read({required String key});

  Future<void> init();
}
