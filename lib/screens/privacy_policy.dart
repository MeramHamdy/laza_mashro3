import 'package:flutter/material.dart';
import 'package:laza_mashro3/widgets/about_privacy.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return const AboutPrivacy(
      screenName: 'Privacy Policy',
      txt1: 'Privacy Policy for Laza\n\n',
      txt2: '''*Data Collection* 
- We may collect personal information such as your name, email address, and payment details when you create an account or make a purchase.
- We also collect non-personal information, such as usage data, to improve our app’s services.\n
        
*Data Usage*
- Personal information is used to process transactions, enhance user experience, and communicate important updates regarding your account or orders.
- Non-personal data helps us understand app usage trends and optimize functionality.\n
        
*Data Security*
- We implement robust security measures to protect your personal information from unauthorized access, alteration, or misuse.\n
        
*Data Sharing*
- We do not sell or rent your personal data to third parties.
- We may share your information with trusted partners who help operate our app and conduct business, provided they maintain confidentiality.\n
        
*User Rights*
- You have the right to access, correct, or delete your personal information at any time. Contact us at [laza@gmail.com] to exercise these rights.\n
        
*Policy Updates*
- We may update this Privacy Policy periodically.
- Any changes will be communicated through updates posted on our app.''',
      addTeam: null,
    );
  }
}
