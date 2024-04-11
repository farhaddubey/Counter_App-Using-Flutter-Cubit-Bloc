import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }
  // We'r interested to replace this counter logic by counter_cubit logic
  final counterCubit = CounterCubit();


  @override
  Widget build(BuildContext context) {
    // final counter = counterCubit.state; //Cause of two time init it failed to change the value hence to used the
    // instantiate of CounterCubit()
    // Using that line we dont update the state. We just get one time value


        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterCubit, int>(
                  bloc: counterCubit,
                  builder: (context, counter) {
                    return Text(
                      '$counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                // onPressed: _incrementCounter,
                onPressed: (){
                  counterCubit.increment();
                  // setState(() {});
                  // If we don't want to use this setstate then We've to use the block builer mehtod
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                // onPressed: _incrementCounter,
                onPressed: (){
                  counterCubit.decrement();
                  // setState(() {});
                  // If we don't want to use this setstate then We've to use the block builer mehtod
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.exposure_minus_2_sharp),
              ),
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );

  }
}
