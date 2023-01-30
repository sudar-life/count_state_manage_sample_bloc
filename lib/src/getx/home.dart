import 'package:count_state_manage_sample/src/getx/count_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetxHome extends GetView<CountGetxController> {
  const GetxHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Getx상태관리')),
      body: Center(
          child: Obx(
        () => Text(
          controller.count.value.toString(),
          style: TextStyle(fontSize: 80),
        ),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: controller.addCount,
            child: Icon(Icons.add),
          ),
          const SizedBox(width: 30),
          FloatingActionButton(
            onPressed: controller.substractCount,
            backgroundColor: Colors.red,
            child: Text('-'),
          ),
        ],
      ),
    );
  }
}
