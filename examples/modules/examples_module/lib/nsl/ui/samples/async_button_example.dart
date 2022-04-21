
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../signal/async_button_signal.dart';

class AsyncButtonExample extends ConsumerWidget {
  const AsyncButtonExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Button example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                'Press The button to call the API and leave the Page once the request is done'),
            AsyncButton(
              onPressedAsync: () async {
                await ref.watch(asyncButtonSignalProvider).dispatch();
                Navigator.of(context).pop();
              },
              child: (const Text('PRESS ME')),
            )
          ],
        ),
      ),
    );
  }
}

class AsyncButton extends StatefulWidget {
  final Widget child;
  final Future<void> Function() onPressedAsync;

  const AsyncButton(
      {Key? key, required this.onPressedAsync, required this.child})
      : super(key: key);

  @override
  State<AsyncButton> createState() => _AsyncButtonState();
}

class _AsyncButtonState extends State<AsyncButton> {
  // this is simple example, you can use the whole store circle, or just
  // future provider in this case
  var _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
            width: 200,
            child:
                _inProgress ? const LinearProgressIndicator() : widget.child));
  }

  void onPressed() async {
    setState(() {
      _inProgress = true;
    });

    await widget.onPressedAsync();

    setState(() {
      _inProgress = false;
    });
  }
}
