import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wedevs_flutter_task/data/model/user_model.dart';
import 'package:wedevs_flutter_task/data/repository/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository = LoginRepository();
  UserModel? userLoggedInInfo = UserModel(
      token: '', userEmail: '', userDisplayName: '', userNicename: '');
  final userInfo = GetStorage();
  var loginProcess = false.obs;

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void login() async {
    loginProcess(true);
    try {
      userLoggedInInfo = await loginRepository.signInWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);
      print("userLoggedInInfo : $userLoggedInInfo");
      if (userLoggedInInfo != null) {
        if (userLoggedInInfo?.token != '') {
          userInfo.write('userData', userLoggedInInfo);
          userInfo.write('token', userLoggedInInfo?.token ?? '');
          userInfo.write('user_email', userLoggedInInfo!.userEmail);
          userInfo.write('user_nicename', userLoggedInInfo!.userNicename);
          userInfo.write(
              'user_display_name', userLoggedInInfo!.userDisplayName);
        }
      }
    } finally {
      loginProcess(false);
    }
  }

// Future<String?> loginTokenApi ({email, password}) async
// {
//   loginProcess(true);
//   var url = Uri.parse('https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token');
//
//   try {
//     Map data = {
//       "username": email,
//       "password": password
//     };
//     var body = json.encode(data);
//     var response = await http.post(url,
//         headers: {"Content-Type": "application/x-www-form-urlencoded"},
//         body: body
//     );
//     print("rsponse body : ${response.statusCode}");
//     if (response.statusCode == 200) {
//       final responseJson = json.decode(response.body);
//       print("registration response : $responseJson");
//       return responseJson;
//     } else if(response.statusCode == 403)
//     {
//       final responseJson = json.decode(response.body);
//       String error = responseJson['message'];
//       return error;
//     }
//   } finally{
//     loginProcess(false);
//   }
// }

// Future<UserRegistration> loginUserApi(String token,String password) async
// {
//   var url = baseUrl + '/rest/V1/customers/me';
//   try
//   {
//     String headerText = "Bearer " + token;
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       HttpHeaders.authorizationHeader: headerText
//     });
//
//     if (response.statusCode == 200) {
//       final responseJson = json.decode(response.body);
//       print("login response : $responseJson");
//       UserRegistration userData = UserRegistration.fromJson(responseJson);
//
//       if(userData != null)
//       {
//
//         userInfo.write('userData', response.body);
//         userRegistrationInfo.assign(userData);
//         userInfo.write("loginStatus", true);
//         userInfo.write("email", userRegistrationInfo[0].email);
//         userInfo.write("password", password);
//         userInfo.write("email", userRegistrationInfo[0].email);
//         userInfo.write("customer_id", userRegistrationInfo[0].id);
//         userInfo.write("firstname", userRegistrationInfo[0].firstname);
//         userInfo.write("lastname", userRegistrationInfo[0].lastname);
//         String fullName = userRegistrationInfo[0].firstname+" "+userRegistrationInfo[0].lastname;
//         var arr = userRegistrationInfo[0].addresses;
//         print(userRegistrationInfo[0].addresses);
//         if (arr.length > 0)
//         {
//           if(userRegistrationInfo[0].addresses[0].telephone == null){
//             userInfo.write("phone", "");
//           }else{
//             userInfo.write("phone", userRegistrationInfo[0].addresses[0].telephone);
//           }
//
//           userInfo.write("city", userRegistrationInfo[0].addresses[0].city??"");
//           userInfo.write("postalcode", userRegistrationInfo[0].addresses[0].postcode??"");
//           var street = userRegistrationInfo[0].addresses[0].street;
//           if (street.length > 0) {
//             userInfo.write("street0", street[0]);
//           }
//           if (street.length > 2) {
//             userInfo.write("street1", street[1]);
//           }
//         }else{
//           userInfo.write("phone", "");
//         }
//
//       }
//     } else {
//       return null;
//     }
//   } catch (e) {
//     throw Exception(e.toString());
//   }
// }

}
