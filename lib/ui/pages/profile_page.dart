import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:wedevs_flutter_task/controller/login_controller.dart';
import 'package:wedevs_flutter_task/controller/profile_controller.dart';
import 'package:wedevs_flutter_task/routes/app_routes.dart';
import 'package:wedevs_flutter_task/ui/widget/text_field_widget.dart';
import '../animation/fade_animation.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController controller = Get.find<ProfileController>();
  // final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.retriveData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // loginController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      left: true,
      right: true,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: NeverScrollableScrollPhysics(),
              children: [
                const SizedBox(height: 22),
                Obx(
                  () => TextFieldWidget(
                    label: 'Display Name',
                    text: controller.display_name.value,
                    onChanged: (name) {},
                  ),
                ),
                const SizedBox(height: 22),
                Obx(
                  () => TextFieldWidget(
                    label: 'Email',
                    text: controller.email.value,
                    onChanged: (name) {},
                  ),
                ),
                const SizedBox(height: 22),
                Obx(
                  () => TextFieldWidget(
                    label: 'Nice Name',
                    text: controller.nice_name.value,
                    onChanged: (about) {},
                  ),
                ),
                const SizedBox(height: 22),

                new InkWell(
                  child: FadeAnimation(2, Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ]
                        )
                    ),
                    child: Center(
                      child: Text("Update", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  )),
                  onTap: () async{

                  },
                ),
                SizedBox(height: 60.0,),
                InkWell(
                  child: FadeAnimation(2, Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ]
                        )
                    ),
                    child: Center(
                      child: Text("Logout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  )),
                  onTap: (){
                    controller.logout();
                  },
                )
              ],
            ),
          )),
    );
  }
}
