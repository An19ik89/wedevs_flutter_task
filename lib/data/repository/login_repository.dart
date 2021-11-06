import 'package:wedevs_flutter_task/data/provider/login_provider.dart';

class LoginRepository {

  final LoginApiClient apiClient = LoginApiClient();

  Future<String?> signInWithEmailAndPassword({String? email,String? password}){
    return apiClient.signInWithUserNamePassword(email: email,password: password);
  }
}