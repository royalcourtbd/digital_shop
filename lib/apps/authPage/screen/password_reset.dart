import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/apps/authPage/controller/password_reset_controller.dart';
import 'package:digital_shop/apps/exchangePage/widgets/text_field_widget.dart';
import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class PasswordResetPageView extends GetView<PasswordResetController> {
  const PasswordResetPageView({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'Don\'t worry! we will send an email to your registered email address.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                height: Config.screenHeight! * 0.08,
                //color: Colors.red,
                child: TextFieldWidget(
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Email Address',
                  textEditingController: controller.passwordController,
                  prefixIcon: const Icon(IconlyLight.message),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (p0) {
                    return controller.validateEmail(p0!);
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: controller.passwordReset,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      Config.screenWidth! - 50,
                      Config.screenHeight! * 0.06,
                    ),
                  ),
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
