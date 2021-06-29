import 'package:flutter/material.dart';

import 'counter_change_view.dart';
import 'counter_state_provider_view.dart';
import 'counter_state_view.dart';

class CounterHomeView extends StatelessWidget {
  const CounterHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Riverpod | Counter App',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CounterStateView.route(),
                );
              },
              child: Text(
                'Counter State Notifier',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CounterChangeView.route(),
                );
              },
              child: Text(
                'Counter Change Notifier',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CounterStateProviderView.route(),
                );
              },
              child: Text(
                'Counter State Provider',
              ),
            )
          ],
        ),
      ),
    );
  }
}
