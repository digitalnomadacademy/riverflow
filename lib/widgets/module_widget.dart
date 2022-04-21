import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/diagnostics.dart';
import '../utils/logger.dart';

class ModuleWidget extends StatefulWidget {
  final WidgetBuilder builder;
  final ProviderContainer Function()? configure;

  const ModuleWidget({Key? key, required this.builder, this.configure})
      : super(key: key);

  @override
  State<ModuleWidget> createState() => _ModuleWidgetState();
}

class _ModuleWidgetState extends State<ModuleWidget>
    with DiagnosticableTreeMixin, ModuleDiagnosticMixin
    implements ProviderContainerSignature {
  @override
  late ProviderContainer providerContainer;

  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
        container: providerContainer, child: Builder(builder: widget.builder));
  }

  @override
  void initState() {
    super.initState();
    logger.d('initializing module $runtimeType');

    providerContainer =
        widget.configure != null ? widget.configure!() : ProviderContainer();
  }

  @override
  void dispose() {
    super.dispose();
    providerContainer.dispose();
    logger.d('disposing module $runtimeType');
  }
}
