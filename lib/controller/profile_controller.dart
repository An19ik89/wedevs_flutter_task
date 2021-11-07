import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wedevs_flutter_task/data/model/updated_user_response.dart';
import 'package:wedevs_flutter_task/data/repository/profile_repository.dart';
import 'package:wedevs_flutter_task/routes/app_routes.dart';


class ProfileController extends GetxController
{

  final userInfo = GetStorage();
  var updateProcess = false.obs;

  RxString display_name = ''.obs;
  RxString email = ''.obs;
  RxString nice_name = ''.obs;
  RxString first_name = ''.obs;
  RxString last_name = ''.obs;

  final ProfileRepository profileRepository = ProfileRepository();

  UpdatedUserResponse? userLoggedInInfoAfterUpdate = UpdatedUserResponse(name: '', firstName: '', lastName: '',email: '',nickname: '');

  @override
  void onInit() {
    super.onInit();
  }

  retriveData(){
    display_name.value=  userInfo.read('user_display_name');
    email.value = userInfo.read('user_email');
    nice_name.value = userInfo.read('user_nicename');
    first_name.value = userInfo.read('first_name');
    last_name.value = userInfo.read('last_name');
  }

  void updateProfile() async
  {
    updateProcess(true);
    try
    {
      String? token = userInfo.read('token');
      userLoggedInInfoAfterUpdate = await profileRepository.updateProfile(
          email: email.value,
          displayName: display_name.value,
          niceName: nice_name.value,
          firstName: first_name.value,
          lastName: last_name.value,
          token: token
      );
      if(userLoggedInInfoAfterUpdate != null){
        userInfo.write('first_name', userLoggedInInfoAfterUpdate!.firstName);
        userInfo.write('last_name', userLoggedInInfoAfterUpdate!.lastName);
        userInfo.write('user_display_name', userLoggedInInfoAfterUpdate!.name);
        userInfo.write('user_nicename', userLoggedInInfoAfterUpdate!.nickname);
        userInfo.write('user_email', userLoggedInInfoAfterUpdate!.email);

        //retriveData();
      }

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
        userInfo.remove('id');
        userInfo.remove('first_name');
        userInfo.remove('last_name');
        userInfo.write('SignIn',false);
        Get.deleteAll();
        Get.toNamed(Routes.INITIAL);

    }
    );
  }
}
