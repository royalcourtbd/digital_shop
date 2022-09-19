import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/apps/authPage/controller/auth_controller.dart';
import 'package:digital_shop/apps/authPage/controller/login_page_controller.dart';
import 'package:digital_shop/apps/authPage/screen/password_reset.dart';
import 'package:digital_shop/apps/authPage/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/routes/routes.dart';
import '../../../general/utils/config.dart';
import '../widgets/text_field_for_in_up.dart';

class LoginPageView extends GetView<LoginPageController> {
  LoginPageView({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: BackGround(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //color: Colors.amber,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const AutoSizeText(
                'LOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 39, 168, 56),
                  fontSize: 30,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: Config.screenHeight! * 0.02,
            ),
            Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFieldForInUp(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email',
                    validator: (value) {
                      return controller.emailValidation(value!);
                    },
                  ),
                  SizedBox(
                    height: Config.screenHeight! * 0.02,
                  ),

                  TextFieldForInUp(
                    controller: controller.passwordController,
                    keyboardType: TextInputType.text,
                    labelText: 'Password',
                    obscureText: true,
                    validator: ((value) {
                      return controller.passwordValidation(value);
                    }),
                  ),

                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const PasswordResetPage());

                        // Get.bottomSheet(
                        //   Container(
                        //     height: 200,
                        //     width: double.infinity,
                        //     decoration: BoxDecoration(
                        //       color: Colors.green.shade100,
                        //     ),
                        //     child: Form(
                        //       key: controller.passwordForgotFormKey,
                        //       child: Column(
                        //         children: [
                        //           TextFieldForInUp(
                        //             controller:
                        //                 controller.resetPasswordController,
                        //             keyboardType: TextInputType.emailAddress,
                        //             labelText: 'Type Your Email',
                        //             validator: ((value) {
                        //               return controller
                        //                   .resetEmailValidation(value!);
                        //             }),
                        //           ),
                        //           ElevatedButton(
                        //               onPressed: () {},
                        //               child:
                        //                   const AutoSizeText('Reset Password'))
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // );
                      },
                      child: const AutoSizeText(
                        'Forgot Your Password?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: Config.screenHeight! * 0.03,
                  // ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.logInButton();
                        const CircularProgressIndicator();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: Config.screenWidth! * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(0, 20, 194, 43),
                              Color.fromARGB(0, 123, 13, 145)
                            ],
                          ),
                        ),
                        child: const Text('Login'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        Get.offNamed(RoutesClass.getSignUpPagePageRoute());
                      },
                      child: const AutoSizeText(
                        'Don\'t have an Account? Sign Up',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
