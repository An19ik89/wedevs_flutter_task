import 'package:wedevs_flutter_task/data/model/updated_user_response.dart';
import 'package:wedevs_flutter_task/data/provider/profile_provider.dart';

class ProfileRepository {

  final ProfileApiClient apiClient = ProfileApiClient();

  Future<UpdatedUserResponse?> updateProfile({String? email,String? displayName,String? niceName,String? firstName, String? lastName, String? token}){
    return apiClient.updateProfile(email: email,displayName: displayName,niceName: niceName,firstName: firstName,lastName: lastName,token: token);
  }
}