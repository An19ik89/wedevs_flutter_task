import 'package:get/get.dart';
import 'package:wedevs_flutter_task/bindings/login_bindings.dart';
import 'package:wedevs_flutter_task/routes/app_routes.dart';
import 'package:wedevs_flutter_task/ui/pages/details_page.dart';
import '../ui/pages/login_page.dart';


class AppPages{
  static final Pages = [
    GetPage(name: Routes.INITIAL, page: () => LoginPage(),binding: LoginBinding()),
    GetPage(name: Routes.DETAILS, page: () => DetailsPage()),
  ];
}