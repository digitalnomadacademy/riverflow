
import 'package:riverflow/utils/command.dart';
import 'package:riverpod/src/provider.dart';

class AsyncButtonCommand extends AsyncCommand0 {
  AsyncButtonCommand(ProviderRef ref) : super(ref);

  @override
  Future<void> execute() async {
    // simulate wait from the API
    await Future.delayed(const Duration(seconds: 3));
  }
}
