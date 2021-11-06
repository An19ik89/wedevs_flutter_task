import 'package:get/get.dart';
import 'package:wedevs_flutter_task/bindings/login_bindings.dart';
import 'package:wedevs_flutter_task/bindings/profile_bindings.dart';
import 'package:wedevs_flutter_task/bindings/sign_up_bindings.dart';
import 'package:wedevs_flutter_task/routes/app_routes.dart';
import 'package:wedevs_flutter_task/ui/pages/profile_page.dart';
import 'package:wedevs_flutter_task/ui/pages/sign_up_page.dart';
import '../ui/pages/login_page.dart';


class AppPages{
  static final Pages = [
    GetPage(name: Routes.INITIAL, page: () => LoginPage(),binding: LoginBinding()),
    GetPage(name: Routes.SIGNUP, page: () => SignUpPage(),binding: SignUpBinding()),
    GetPage(name: Routes.PROFILE, page: () => ProfilePage(),binding: ProfileBinding()),
  ];
}