import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal.dart';


var asyncButtonSignalProvider = Provider((ref) => AsyncButton());

class AsyncButton extends AsyncSignal0 {}
