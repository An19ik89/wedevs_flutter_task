import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:wedevs_flutter_task/controller/profile_controller.dart';
import 'package:wedevs_flutter_task/ui/widget/text_field_widget.dart';
import '../animation/fade_animation.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    profileController.retriveData();
  }

  @override
  void dispose() {
    super.dispose();
    profileController.dispose();
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
            child: Obx((){
              if (profileController.updateProcess.value) {
                return new Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: new Center(
                    child:  new SpinKitPulse(
                      color: Colors.red,
                      size: 50.0,
                    ),
                  ),
                );
              }
              else{
                return ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 22),
                    Obx(
                          () => TextFieldWidget(
                        label: 'Display Name',
                        text: profileController.display_name.value,
                        onChangeds: (val) {
                          profileController.display_name(val);
                        },
                      ),
                    ),
                    const SizedBox(height: 22),
                    Obx(
                          () => TextFieldWidget(
                        label: 'Email',
                        text: profileController.email.value,
                        onChangeds: (String val) {
                          profileController.email(val);
                        },
                      ),
                    ),
                    const SizedBox(height: 22),
                    Obx(
                          () => TextFieldWidget(
                        label: 'Nick Name',
                        text: profileController.nice_name.value,
                        onChangeds: (val) {
                          profileController.nice_name(val);
                        },
                      ),
                    ),
                    const SizedBox(height: 22),
                    Obx(
                          () => TextFieldWidget(
                        label: 'First Name',
                        text: profileController.first_name.value,
                        onChangeds: (val) {
                          profileController.first_name(val);
                        },
                      ),
                    ),
                    const SizedBox(height: 22),
                    Obx(
                          () => TextFieldWidget(
                        label: 'Last Name',
                        text: profileController.last_name.value,
                        onChangeds: (val) {
                          profileController.last_name(val);
                        },
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
                        profileController.updateProfile();
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
                        profileController.logout();
                      },
                    ),
                    SizedBox(height: 20.0,),
                  ],
                );
              }

            })
          )),
    );
  }


}
