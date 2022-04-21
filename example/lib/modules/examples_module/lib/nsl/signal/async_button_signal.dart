import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal.dart';

var asyncButtonClickedSignalProvider = Provider((ref) => AsyncButtonClicked());

class AsyncButtonClicked extends AsyncSignal0 {}
