import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wedevs_flutter_task/routes/app_pages.dart';
import 'package:wedevs_flutter_task/routes/app_routes.dart';
import 'package:wedevs_flutter_task/ui/theme/app_theme.dart';
import 'ui/pages/login_page.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final check = GetStorage();
  @override
  Widget build(BuildContext context) {
    return new GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: check.read('SignIn') == true ? Routes.PROFILE : Routes.INITIAL,
      getPages: AppPages.Pages,
      title: 'Wedevs Task',
      defaultTransition: Transition.fade,
      theme: appThemeData
    );
  }
}


