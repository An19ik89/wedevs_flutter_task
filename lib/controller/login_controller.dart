import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wedevs_flutter_task/data/model/user_model.dart';
import 'package:wedevs_flutter_task/data/repository/login_repository.dart';
import 'package:wedevs_flutter_task/routes/app_routes.dart';

class LoginController extends GetxController {

  final LoginRepository loginRepository = LoginRepository();
  UserModel? userLoggedInInfo = UserModel(token: '', userEmail: '', userDisplayName: '', userNicename: '');
  final userInfo = GetStorage();
  var loginProcess = false.obs;

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
  }

  void login() async {
    loginProcess(true);
    try {
      userLoggedInInfo = await loginRepository.signInWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);
      if (userLoggedInInfo != null)
      {
        if (userLoggedInInfo?.token != '')
        {
          userInfo.write('userData', userLoggedInInfo);
          userInfo.write('token', userLoggedInInfo?.token ?? '');
          userInfo.write('user_email', userLoggedInInfo!.userEmail);
          userInfo.write('user_nicename', userLoggedInInfo!.userNicename);
          userInfo.write('user_display_name', userLoggedInInfo!.userDisplayName);
          userInfo.write('SignIn',true);
          UserModel? model = await loginRepository.getUserDetails(token: userLoggedInInfo?.token);
          userInfo.write('first_name', model!.firstName);
          userInfo.write('last_name', model.lastName);
          userInfo.write('id', model.id);
          Get.deleteAll();
          Get.toNamed(Routes.PROFILE);
        }
      }
    } finally {
      loginProcess(false);
    }
  }
}
