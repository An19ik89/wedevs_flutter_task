import 'package:get/get.dart';
import 'package:wedevs_flutter_task/controller/login_controller.dart';
import 'package:wedevs_flutter_task/controller/profile_controller.dart';


class ProfileBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() {
      return ProfileController();
    });
  }
}