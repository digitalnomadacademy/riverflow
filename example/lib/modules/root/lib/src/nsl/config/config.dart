import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../service/local_store_service.dart';

Future<void> initLocalStorage(ProviderContainer container) async {
  var localStorageService = container.read(localStorageServiceProvider);
  await localStorageService.init();
}
