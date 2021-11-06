import 'package:wedevs_flutter_task/data/model/user_model.dart';
import 'package:wedevs_flutter_task/data/provider/login_provider.dart';

class LoginRepository {

  final LoginApiClient apiClient = LoginApiClient();

  Future<UserModel?> signInWithEmailAndPassword({String? email,String? password}){
    return apiClient.signInWithUserNamePassword(email: email,password: password);
  }
}