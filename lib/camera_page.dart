import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/home_page.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text("something in camera page"),
        ElevatedButton(
            onPressed: () => Get.to(
                  () => const HomePage(),
                ),
            child: Text("something"))
      ],
    ));
  }
}
