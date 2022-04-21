import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../observables/sum_observable.dart';
import '../../signal/update_sum_signal.dart';

class SumExample extends ConsumerWidget {
  static const id = "EmptyDispatchSample";

  final a = TextEditingController();
  final b = TextEditingController();

  SumExample({
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: a,
                  ),
                  TextField(
                    controller: b,
                  )
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, _) {
                final sum = ref.watch(sumObservableProvider).sum;

                return Text(
                  '$sum',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(updateSumSignalProvider)
              .dispatch(UpdateSumPayload(int.parse(a.text), int.parse(b.text)));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
