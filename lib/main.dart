import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_flutter_task/routes/app_pages.dart';
import 'package:wedevs_flutter_task/routes/app_routes.dart';
import 'package:wedevs_flutter_task/ui/theme/app_theme.dart';
import 'ui/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.Pages,
      title: 'Wedevs Task',
      defaultTransition: Transition.fade,
      theme: appThemeData
    );
  }
}


