import 'package:flutter/material.dart';

class PrivacyPolicyPageView extends StatelessWidget {
  const PrivacyPolicyPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '"Our app, Digital Shop, values the privacy of our users. We collect information in order to provide a better shopping experience for our customers. The information we collect includes:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '\u2022 Personal information such as name, email address, and mailing address when creating an account or placing an order.\n\n \u2022 Payment information, including credit card details, used for purchasing products on our app.\n\n \u2022 Device information, including IP address, device type, and operating system.\n\n \u2022 Information about your use of our app, such as pages viewed and products searched for.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'We use the information collected to process orders, provide customer support, and improve the functionality of our app. We may also use the information for marketing and promotional purposes, such as sending promotional emails or notifications about new products.\n\nWe use third-party service providers to assist us in providing our services, such as payment processing and shipping. These providers have access to the information needed to perform their functions but are not permitted to share or use the information for any other purpose.\n\nWe take the security of your personal information very seriously and have implemented appropriate measures to protect it from unauthorized access or disclosure. However, no method of transmission over the internet or method of electronic storage is 100% secure. As a result, we cannot guarantee the absolute security of your personal information.\n\nBy using our app, you consent to our privacy policy. We reserve the right to modify this policy at any time, and any changes will be reflected on this page. If you have any questions about our privacy policy, please contact us."',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
