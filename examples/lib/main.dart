import 'package:examples_module/examples.dart';
import 'package:flutter/material.dart';
import 'package:root/root.dart';
import 'package:time_zone_time_module/time_zone_time_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var providerContainer = await RootModule.initRootModule(true);

  runApp(RootModule(
    providerContainer: providerContainer,
    builder: (context) {
      return ExamplesModule(
        moduleExample: (context, examplesContainer) => TimeZoneModule(
          parent: examplesContainer,
        ),
      );
    },
  ));
}
