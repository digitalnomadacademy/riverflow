import 'package:nsl/utils/actor.dart';
import 'package:riverpod/src/provider.dart';

abstract class BaseStore extends BaseActor {
  BaseStore(ProviderRef ref) : super(ref);
}
