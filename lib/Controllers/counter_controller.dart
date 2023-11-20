import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;
  increment() => {print(counter), counter.value++};
  decrement() => {print(counter), if (counter.value > 0) counter.value--};
}
