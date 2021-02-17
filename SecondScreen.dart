import 'package:flutter/material.dart';
import 'package:be_your_shopper/Cart.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppersListHomePage(),
    );
  }
}

class ShoppersListHomePage extends StatefulWidget {
  @override
  _ShoppersListHomePageState createState() => _ShoppersListHomePageState();
}

class _ShoppersListHomePageState extends State<ShoppersListHomePage> {
  var shopperList = ["John", "Sam", "Connor", "Alice", "Sarah", "Anna"];

  var descriptionList = [
    "Able to deliver to the east",
    "Able to deliver to the east and west",
    "Able to deliver to the south",
    "Able to deliver to the west",
    "Able to deliver to the north and west",
    "Able to deliver to the south and east"
  ];

  var imgList = [
    "assets/images/man1.jpg",
    "assets/images/man2.jpg",
    "assets/images/man3.jpg",
    "assets/images/lady1.jpg",
    "assets/images/lady2.jpg",
    "assets/images/lady3.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        appBar: AppBar(
          title: Text('Shoppers List'),
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    showDialogFunc(context, imgList[index], shopperList[index],
                        descriptionList[index]);
                  },
                  child: Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.asset(imgList[index]),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                shopperList[index],
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: width,
                                  child: Text(descriptionList[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ))),
                              SizedBox(
                                height: 10,
                              ),
                              RaisedButton(
                                child: Text('Hire'),
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cart()),
                                  );
                                },
                              )
                            ],
                          ))
                    ],
                  )));
            }));
  }
}

showDialogFunc(context, img, title, price) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: Material(
                type: MaterialType.transparency,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            img,
                            width: 200,
                            height: 200,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(title,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(price,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ))));
      });
}
