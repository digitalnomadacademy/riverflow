import 'dart:developer';
import 'dart:io';

import 'package:hive/hive.dart';

import '../local_store_service.dart';

class HiveLocalStorageService implements LocalStorageService {
  final String boxName;
  Future<Directory> pathFuture;

  HiveLocalStorageService({
    required this.boxName,
    required this.pathFuture,
  });

  Box getBox() {
    return Hive.box(boxName);
  }

  @override
  Future<void> init() async {
    var path = await pathFuture;
    Hive.init(path.path);
  }

  @override
  void write({
    required String key,
    required dynamic value,
  }) {
    try {
      final box = getBox();

      box.put(key, value);
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  dynamic read({
    required String key,
  }) {
    try {
      final box = getBox();

      return box.get(key);
    } catch (error) {
      log(error.toString());
    }
  }
}
