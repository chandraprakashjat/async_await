import 'dart:async';

import 'package:flutter/material.dart';

import 'my_stream.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Await for')),
      body: Center(
        child: FutureBuilder(
            future: getTotalValue(MyStream().stream),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Error');
              } else {
                return Text('${snapshot.data}');
              }
            }),
      ),
    );
  }

  Future<int> getTotalValue(Stream<int> item) async {
    int count = 0;

    await for (var value in item) {
      print('Await for value $value');
      count += value;
    }

    return count;
  }
}
