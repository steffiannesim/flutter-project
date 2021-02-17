import 'package:be_your_shopper/Cart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GroceryListHomePage(),
    );
  }
}

class GroceryListHomePage extends StatefulWidget {
  @override
  _GroceryListHomePageState createState() => _GroceryListHomePageState();
}

class _GroceryListHomePageState extends State<GroceryListHomePage> {
  var titleList = [
    "Tomato",
    "Broccoli",
    "Lettuce",
    "Apple",
    "Beef",
    "Chicken",
    "Tofu",
    "Milk",
    "Bread",
    "Noodles",
    "Rice",
    "Potato"
  ];

  var priceList = [
    "\$2.50",
    "\$2.50",
    "\$2.15",
    "\$4.35",
    "\$13.00",
    "\$14.00",
    "\$1.00",
    "\$6.00",
    "\$2.50",
    "\$2.00",
    "\$10.00",
    "\$3.00"
  ];

  var imgList = [
    "assets/images/tomato.jpg",
    "assets/images/broccoli.jpg",
    "assets/images/lettuce.jpg",
    "assets/images/apple.jpg",
    "assets/images/beef.jpg",
    "assets/images/chicken.jpg",
    "assets/images/tofu.jpg",
    "assets/images/milk.jpg",
    "assets/images/bread.jpg",
    "assets/images/noodles.jpg",
    "assets/images/rice.jpg",
    "assets/images/potato.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        appBar: AppBar(
          title: Text('Grocery List'),
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    showDialogFunc(context, imgList[index], titleList[index],
                        priceList[index]);
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
                                titleList[index],
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
                                  child: Text(priceList[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ))),
                              SizedBox(
                                height: 10,
                              ),
                              IconButton(
                                icon: Icon(Icons.shopping_cart),
                                color: Colors.black,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => new Cart(),
                                      ));
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
                      ],
                    ))));
      });
}
