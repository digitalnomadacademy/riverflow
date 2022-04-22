import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/actor.dart';

abstract class BaseService extends BaseActor {
  BaseService(ProviderContainer providerContainer) : super(providerContainer);
}
