import 'package:get/get.dart';
import 'package:wedevs_flutter_task/controller/login_controller.dart';


class LoginBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController();
    });
  }
}