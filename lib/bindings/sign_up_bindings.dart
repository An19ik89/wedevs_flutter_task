import 'package:get/get.dart';
import 'package:wedevs_flutter_task/controller/sign_up_controller.dart';

class SignUpBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() {
      return SignUpController();
    });
  }
}