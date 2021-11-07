import 'package:wedevs_flutter_task/data/model/sign_up_response.dart';
import 'package:wedevs_flutter_task/data/provider/sign_up_provider.dart';

class SignUpRepository {

  final SignUpApiClient apiClient = SignUpApiClient();

  Future<SignUpResponse?> signUpWithEmailUsernamePassword({String? email,String? password,String? userName}){
    return apiClient.signUpWithUserNameEmailPassword(email: email,password: password,userName: userName);
  }
}