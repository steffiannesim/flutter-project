import 'package:be_your_shopper/About.dart';
import 'package:be_your_shopper/HomeScreen.dart';
import 'package:be_your_shopper/ProfilePage.dart';
import 'package:be_your_shopper/SecondScreen.dart';
import 'package:be_your_shopper/Cart.dart';
import 'package:be_your_shopper/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int selectedPage = 0;

  final _pageOptions = [
    HomeScreen(),
    SecondScreen(),
    Cart(),
    About(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.blue[50],
              appBar: AppBar(
                title: Text('Be My Shopper'),
                backgroundColor: Colors.blue[400],
                elevation: 0.0,
                actions: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('logout'),
                    onPressed: () async {
                      await _auth.signOut();
                    },
                  ),
                ],
              ),
              body: _pageOptions[selectedPage],
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.fastfood, size: 20), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.people, size: 20), label: 'Shoppers'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart, size: 20), label: 'Cart'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.info_outline, size: 20), label: 'About'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person, size: 20), label: 'Profile'),
                ],
                selectedItemColor: Colors.black,
                elevation: 5.0,
                unselectedItemColor: Colors.blue[400],
                currentIndex: selectedPage,
                backgroundColor: Colors.white,
                onTap: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                },
              ),
            )));
  }
}
