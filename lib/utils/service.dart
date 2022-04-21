import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'actor.dart';

abstract class BaseService extends BaseActor {
  BaseService(ProviderRef ref) : super(ref);
}
