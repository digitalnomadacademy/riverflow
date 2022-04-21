import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/widgets/module_widget.dart';

import '../config/config.dart';

class RootModule extends StatelessWidget {
  static Future<ProviderContainer> initRootModule(
      bool shouldInitLocalStorage) async {
    final container = ProviderContainer();

    // TODO: initLocalStorage isn't working with tests yet
    // if env is test, then local storage must be memory storage implementation
    if (shouldInitLocalStorage == true) await initLocalStorage(container);

    return ProviderContainer();
  }

  final WidgetBuilder builder;
  final ProviderContainer providerContainer;

  const RootModule(
      {Key? key, required this.builder, required this.providerContainer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleWidget(
      configure: () => providerContainer,
      builder: builder,
    );
  }
}
