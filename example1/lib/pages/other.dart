import 'package:example1/controllers/counterController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherPage extends StatelessWidget {
  final CounterController counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Pages was Clicked ${counterController.counter.value} times"),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Open Other Screen'))
        ],
      ),
    );
  }
}
