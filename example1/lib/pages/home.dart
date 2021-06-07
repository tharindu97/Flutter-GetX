import 'package:example1/controllers/counterController.dart';
import 'package:example1/pages/other.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Clickes!: ${counterController.counter.value}')),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.to(OtherPage());
                },
                child: Text('Open Other Screen')),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
