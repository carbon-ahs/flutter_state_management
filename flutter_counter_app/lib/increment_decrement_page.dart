import 'package:flutter/material.dart';

class IncrementDecrementPage extends StatelessWidget {
  const IncrementDecrementPage({super.key});

  @override
  Widget build(BuildContext context) {
   floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncremented());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              // counterCubit.decrement();
              counterBloc.add(CounterDecremented());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}