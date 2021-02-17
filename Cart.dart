import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
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
  ];

  var descriptionList = [
    "Able to deliver to the east",
    "Able to deliver to the east and west"
  ];

  var imgList2 = ["assets/images/man1.jpg"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
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
                          ],
                        ))
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: new Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: new Text("Total:"),
                subtitle: new Text("\$5",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              )),
              Expanded(
                  child: new MaterialButton(
                onPressed: () {},
                child: new Text(
                  "Check out",
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.blue,
              )),
            ],
          )),
    );
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
