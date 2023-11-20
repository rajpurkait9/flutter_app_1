import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/Controllers/counter_controller.dart';
import 'package:ticket/camera_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Ticket'),
      ),
      body: Container(
        child: Column(children: [
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.snackbar("error", "something show in msg");
                },
                child: const Text('Button 1'),
              ),
              ElevatedButton(
                onPressed: () => Get.to(
                  () => const CameraPage(),
                ),
                child: const Text('Button 2'),
              ),
            ],
          ),
          const CounterInc(),
          Card(
            child: ListTile(
              title: const Text('Ticket'),
              subtitle: const Text('Ticket app with some getx feature'),
              // onTap: () {
              //   Get.defaultDialog(
              //     title: "Delete this ticket?",
              //     middleText: "Ticket app with some getx feature",
              //     textConfirm: "ok",
              //     confirmTextColor: Colors.white,
              //     onCancel: () {
              //       Navigator.of(context).pop();
              //     },
              //     onConfirm: () {
              //       Get.snackbar("confirm", "ticket deleted");
              //       Navigator.of(context).pop();
              //     },
              //   );
              // },
              onTap: () {
                Get.bottomSheet(
                    // color: Colors.white,
                    Column(children: [
                  ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text('Ticket'),
                    subtitle: const Text('Ticket app with some getx feature'),
                    onTap: () {
                      Get.changeTheme(ThemeData.dark());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.light_mode),
                    title: const Text('Ticket'),
                    subtitle: const Text('Ticket app with some getx feature'),
                    onTap: () {
                      Get.changeTheme(ThemeData.light());
                    },
                  ),
                ]));
              },
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined), label: "something"),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Camera',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.pool_outlined), label: "pool"),
      ]),
    );
  }
}

class CounterInc extends StatefulWidget {
  const CounterInc({super.key});

  @override
  State<CounterInc> createState() => _CounterInc();
}

class _CounterInc extends State<CounterInc> {
  final CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Obx(() => Text(
            counterController.counter.value.toString(),
            style: const TextStyle(fontSize: 30),
          )),
      Row(
        children: [
          TextButton(
              onPressed: () {
                counterController.increment();
              },
              child: const Text('increment')),
          TextButton(
              onPressed: () {
                counterController.decrement();
              },
              child: const Text('Decrement')),
        ],
      )
    ]);
  }
}
