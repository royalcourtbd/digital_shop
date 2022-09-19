import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/apps/authPage/controller/auth_controller.dart';
import 'package:digital_shop/apps/authPage/controller/signup_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../general/routes/routes.dart';
import '../../../general/utils/config.dart';
import '../widgets/background.dart';
import '../widgets/text_field_for_in_up.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  SignUpPageView({Key? key}) : super(key: key);
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
                'SIGN UP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 66, 192, 61),
                  fontSize: 30,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: Config.screenHeight! * 0.02,
            ),
            Form(
              key: controller.registerFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFieldForInUp(
                    controller: controller.nameController,
                    keyboardType: TextInputType.text,
                    labelText: 'Name',
                    validator: (value) {
                      return controller.nameValidation(value!);
                    },
                  ),
                  SizedBox(
                    height: Config.screenHeight! * 0.02,
                  ),
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
                    controller: controller.numberController,
                    keyboardType: TextInputType.number,
                    labelText: 'Number',
                    maxLength: 11,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      return controller.numberValidation(value!);
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
                    validator: (value) {
                      return controller.passwordValidation(value!);
                    },
                  ),
                  SizedBox(
                    height: Config.screenHeight! * 0.02,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.signUpButton();
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
                        child: const Text('Sign UP'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        Get.offNamed(RoutesClass.getLoginPageRoute());
                      },
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(RoutesClass.getLoginPageRoute());
                        },
                        child: const AutoSizeText(
                          'Already have an Account? Login',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
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
