import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Name: Steffi \n\nEmail: steffiannesim@fms.com\n\n Password: steffi123',
                style: TextStyle(
                  fontSize: 20,
                ))
          ],
        ),
      ),
    );
  }
}
