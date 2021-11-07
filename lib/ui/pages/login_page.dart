import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:wedevs_flutter_task/controller/login_controller.dart';
import 'package:wedevs_flutter_task/routes/app_routes.dart';
import '../animation/fade_animation.dart';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final LoginController loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    loginController.passwordTextController.dispose();
    loginController.emailTextController.dispose();
    loginController.dispose();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Obx(()
          {

            if (loginController.loginProcess.value) {
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
              return new Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/background.png'),
                              fit: BoxFit.fill
                          )
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 30,
                            width: 80,
                            height: 200,
                            child: FadeAnimation(1, Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/light-1.png')
                                  )
                              ),
                            )),
                          ),
                          Positioned(
                            left: 140,
                            width: 80,
                            height: 150,
                            child: FadeAnimation(1.3, Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/light-2.png')
                                  )
                              ),
                            )),
                          ),
                          Positioned(
                            right: 40,
                            top: 40,
                            width: 80,
                            height: 150,
                            child: FadeAnimation(1.5, Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/clock.png')
                                  )
                              ),
                            )),
                          ),
                          Positioned(
                            child: FadeAnimation(1.6, Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                              ),
                            )),
                          )
                        ],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          children: <Widget>[
                            FadeAnimation(1.8, Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10)
                                    )
                                  ]
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey.shade100))
                                    ),
                                    child: TextFormField(
                                      controller: loginController.emailTextController,
                                      keyboardType: TextInputType.emailAddress,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "User Name",
                                          hintStyle: TextStyle(color: Colors.grey[400])
                                      ),
                                      validator: (String? value) => value!.trim().isEmpty ? "Username is require" : null,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: loginController.passwordTextController,
                                      keyboardType: TextInputType.text,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(color: Colors.grey[400])
                                      ),
                                      validator: (String? value) => value!.trim().isEmpty ? "Password is require" : null,
                                    ),
                                  )
                                ],
                              ),
                            )),
                            SizedBox(height: 30,),
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
                                  child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              )),
                              onTap: () async{
                                if(_formKey.currentState!.validate())
                                {
                                  loginController.login();
                                }
                              },
                            ),
                            SizedBox(height: 70,),
                            new InkWell(
                                child: FadeAnimation(1.5,
                                    Text("Sign Up?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                              onTap: (){
                                  Get.toNamed(Routes.SIGNUP);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }),
        )
    );
  }
}



