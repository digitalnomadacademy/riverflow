import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:root/root.dart';

class GlobalTimeExample extends ConsumerWidget {
  const GlobalTimeExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Time example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
              builder: (context, ref, _) => Text(
                ref
                    .watch(globalDateTimeEntityProvider)
                    .dateTime
                    .toIso8601String()
                    .substring(0, 16)
                    .replaceFirst('T', '\n'),
                style: Theme.of(context).textTheme.headline3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
