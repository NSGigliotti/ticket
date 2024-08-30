import 'package:get/get.dart';
import 'package:ticket/controller/movieController.dart';

class MovieBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(Moviecontroller());
  }
}
