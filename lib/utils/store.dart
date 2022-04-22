import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/actor.dart';

abstract class BaseStore extends BaseActor {
  BaseStore(ProviderContainer providerContainer) : super(providerContainer);
}
