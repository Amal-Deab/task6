import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                child: Text(
              ' Hello ${controller.user!.data.user.name}',
              style: TextStyle(fontSize: 18),
            )),
          ),
        ));
  }
}
