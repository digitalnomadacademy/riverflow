library examples;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/widgets/module_widget.dart';

import 'feature/update_counter/ui/counter_page.dart';
import 'nsl/config/config.dart';
import 'nsl/ui/samples/async_button_example.dart';
import 'nsl/ui/samples/global_time_example.dart';
import 'nsl/ui/samples/sum_example.dart';

class ExamplesModule extends StatelessWidget {
  final Widget Function(BuildContext, ProviderContainer) moduleExample;

  const ExamplesModule({Key? key, required this.moduleExample})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleWidget(
      configure: () => configureExamples(),
      builder: (context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ExamplesPage(
          moduleExample: (context) =>
              moduleExample(context, ProviderScope.containerOf(context)),
        ),
      ),
    );
  }
}

class CustomRoutes {
  final String name;
  final Widget widget;

  CustomRoutes(this.name, this.widget);
}

class ExamplesPage extends StatefulWidget {
  final Widget Function(BuildContext) moduleExample;

  const ExamplesPage({Key? key, required this.moduleExample}) : super(key: key);

  @override
  State<ExamplesPage> createState() => _ExamplesPageState();
}

class _ExamplesPageState extends State<ExamplesPage> {
  List<CustomRoutes> samples = [];

  @override
  void initState() {
    super.initState();
    buildRoutes();
  }

  void buildRoutes() async {
    await Future(() {});
    samples = [
      CustomRoutes("Counter Example", const CounterExample()),
      CustomRoutes("Sum Example", SumExample()),
      CustomRoutes("Global Time Example", const GlobalTimeExample()),
      CustomRoutes("Async Button Example", const AsyncButtonExample()),
      CustomRoutes(
          "Module Timezone Time Example", widget.moduleExample(context))
    ];
    setState(() {});
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_, index) => ListTile(
          title: Text(samples[index].name),
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => samples[index].widget)),
        ),
        itemCount: samples.length,
      ),
    );
  }
}
