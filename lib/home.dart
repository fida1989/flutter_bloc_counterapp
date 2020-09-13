import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocConsumer<CounterCubit, CounterState>(
                listener: (BuildContext context, state) {
                  if (state.wasIncremented) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Incremented!"),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  } else if (!state.wasIncremented) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Decremented!"),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  }
                },
                builder: (BuildContext context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}
