import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  static const route = '/terms-and-conditions'; // Define route

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: Center(
        child: Text('Terms and Conditions '

            'Welcome to NaviQuezon! By accessing or using our application, you agree to comply with the following Terms and Conditions. If you do not agree with these terms, please refrain from using the app. '
            ' '
            'Data Privacy and Protections '
            ' '
            'We value your privacy and are committed to protecting your personal information. This section outlines how we collect, use, and safeguard your data: '
            ' '
            'We collect personal information such as names, email address, age, nationality, phone number, gender, and address to entered in our app. '
            'The data we collect will be used only for purposes directly related to access the services of app such as itinerary planning, tracking directions, and gathering tourist arrival information. '
            'We implement industry-standard security measures to protect your personal data from unauthorized access, alteration, or destruction. These measures include encryption, secure connections, and regular system updates. '
            'We do not share your personal data with third parties except as required by law or to perform essential functions necessary to deliver the app’s services, such as through authorized service providers. We will always seek for your consent before sharing personal data for any other reason. '
            'User Responsibilities'
            'By using the NaviQuezon app, you agree to: '
            'Provide accurate and up-to-date information. '
            'Maintain the confidentiality of your login credentials and notify us immediately if you suspect any unauthorized access to your account. '
            'Use the app solely for travel and tour purposes and refrain form engaging in any behavior that could harm the app, its users, or its system. '
            'Security Measures'
            'We take the safety of your data seriously: '
            'All personal data transmitted through the app is encrypted to ensure secure communication between your device and our servers. '
            'We implement strict access controls to prevent unauthorized access to your personal information and learning progress. '
            'Limitation of Liability '
            'While we strive to provide a secure and reliable service, we cannot guarantee that the app will be error-free or continuously available. In no event shall NaviQuezon be liable for any direct, indirect, incidental or consequential damages arising from the use or inability to use the app. '
            'By using NaviQuezon, you acknowledge that you have read and understand these Terms and Conditions and agree to bound by them.'),
      ),
    );
  }
}