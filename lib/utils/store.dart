
import 'package:riverpod/src/provider.dart';

import 'actor.dart';

abstract class BaseStore extends BaseActor {
  BaseStore(ProviderRef ref) : super(ref);
}
