import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../observable/counter_observable.dart';
import '../signal/update_counter_signal.dart';

class CounterExample extends ConsumerWidget {
  static const id = "EmptyDispatchSample";

  const CounterExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('you'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, ref, _) {
                var counterObservable = ref.watch(counterObservableProvider);
                final count = counterObservable.counter;

                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var updateCounterSignal = ref.watch(updateCounterSignalProvider);
          updateCounterSignal.dispatch();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
