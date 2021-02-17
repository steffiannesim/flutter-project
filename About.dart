import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // ignore: missing_required_param
        body: ContactUs(
          tagLine:
              'This application is for shoppers to be able to shop online and get groceries delivered to their doorsteps!',
          email: 'steffiannesim@fms.com',
          companyName: 'Be Your Shopper!',
          cardColor: Colors.blue,
          phoneNumber: '+6587828814',
          facebookHandle: 'steffiannesim',
          website: 'steffiannesim.wix.com',
          twitterHandle: 'steffiannesim',
        ),
      ),
    );
  }
}
