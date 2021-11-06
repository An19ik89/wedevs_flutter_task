import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wedevs_flutter_task/data/model/user_model.dart';
import 'package:wedevs_flutter_task/data/repository/login_repository.dart';
import 'package:wedevs_flutter_task/data/repository/profile_repository.dart';
import 'package:wedevs_flutter_task/routes/app_routes.dart';

import 'login_controller.dart';



class ProfileController extends GetxController
{

  final userInfo = GetStorage();
  var updateProcess = false.obs;

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();

  RxString display_name = ''.obs;
  RxString email = ''.obs;
  RxString nice_name = ''.obs;

  final ProfileRepository profileRepository = ProfileRepository();


  @override
  void onInit() {
    super.onInit();
  }

  retriveData(){
    display_name.value=  userInfo.read('user_display_name');
    email.value = userInfo.read('user_email');
    nice_name.value = userInfo.read('user_nicename');
  }

  void updateProfile() async
  {
    updateProcess(true);
    try
    {
       //  = await profileRepository.updateProfile(
       //     email: emailTextController.text,
       //     password: passwordTextController.text,
       //     name: nameTextController.text,
       //     id: ,
       // );
     //  print("userLoggedInInfo : $userLoggedInInfo");
     //  if(userLoggedInInfo?.token!=''){
     //
     //    userInfo.write('userData', userLoggedInInfo);
     //    userInfo.write('token', userLoggedInInfo!.token);
     //    userInfo.write('user_email', userLoggedInInfo!.userEmail);
     //    userInfo.write('user_nicename', userLoggedInInfo!.userNicename);
     //    userInfo.write('user_display_name', userLoggedInInfo!.userDisplayName);
     //  }

    }finally{
      updateProcess(false);
    }
  }

  void logout()
  {
    Get.defaultDialog(
      title: "Log 0ut!",
      middleText: "Are you sure to log out ?",
      textConfirm: "Yes",
      textCancel: "No",
      onCancel: (){
        navigator?.pop();
      },
      onConfirm: (){
        userInfo.remove('userData');
        userInfo.remove('token');
        userInfo.remove('user_email');
        userInfo.remove('user_nicename');
        userInfo.remove('user_display_name');
        userInfo.write('SignIn',false);
        Get.toNamed(Routes.INITIAL);
    }
    );
  }
}
