import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counterblocprovider.dart'; // Pastikan impor yang benar

void main(List<String> args) {
  runApp(const blocProvider());
}

class blocProvider extends StatelessWidget {
  const blocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBlocc(),
        child: const HomePagebloc(),
      ),
    );
  }
}

class HomePagebloc extends StatelessWidget {
  const HomePagebloc({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CounterBlocc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBlocc, int>(builder: (context, state) {
              return Text(
                "Angka saat ini : $state",
                style: const TextStyle(fontSize: 25),
              );
            }),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    bloc.add(DecrementEvent());
                  },
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    bloc.add(IncrementEvent());
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
