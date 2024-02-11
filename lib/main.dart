import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';
import 'package:learning_bloc/cubits/counters_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (BuildContext context)=>CountersCubit()
      ),
      BlocProvider(
          create: (BuildContext context)=>CounterBloc()
      )
    ],
        child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times using Cubit:',
            ),
            BlocBuilder<CountersCubit, CountersInitial>(
              builder: (context, state) {
                return Text(
                  "${state.counter}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const Text(
              'You have pushed the button this many times using Bloc:',
            ),
            BlocBuilder<CounterBloc,CounterState>(
              builder: (context, state) {
                if(state is CounterLoading){
                  return CircularProgressIndicator();
                }else if(state is CounterUpdate){
                  return Text(
                  "${state.counter}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
                }else if(state is CounterInitial){
                  return Text(
                    "${state.counter}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }else{
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CountersCubit>(context).increment();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CountersCubit>(context).decrement();
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(width: 300,),
             Text("Bloc",textAlign: TextAlign.center),
           ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                 // BlocProvider.of<CountersCubit>(context).increment();
                  BlocProvider.of<CounterBloc>(context).add(BlocCounterIncrement());
                  context.read<CounterBloc>().add(BlocCounterIncrement());
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                //  BlocProvider.of<CountersCubit>(context).increment();
                  BlocProvider.of<CounterBloc>(context).add(BlocCounterDecrement());
                  context.read<CounterBloc>().add(BlocCounterDecrement());
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
