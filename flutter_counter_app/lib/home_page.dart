import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubit/counter_cubit.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterCubit = CounterCubit();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterCubit, int>(
              bloc: counterCubit,
              builder: (context, counter) {
                return Text(
                  'yoo $counter',
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterCubit.increment();
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
