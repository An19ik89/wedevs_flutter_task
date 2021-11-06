import 'package:wedevs_flutter_task/data/model/user_model.dart';
import 'package:wedevs_flutter_task/data/provider/login_provider.dart';
import 'package:wedevs_flutter_task/data/provider/profile_provider.dart';

class ProfileRepository {

  final ProfileApiClient apiClient = ProfileApiClient();

  Future<UserModel?> updateProfile({String? email,String? name,String? password,String? id}){
    return apiClient.updateProfile(email: email,name: name,password: password,id: id);
  }
}