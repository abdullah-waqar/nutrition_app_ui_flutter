import 'package:flutter/material.dart';
import 'package:nutrition_app_clone/details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21BFBD),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                ),
                Container(
                  width: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(Icons.filter_list)),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: const [
                Text(
                  "Healthy",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Food",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 180,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75))),
            child: ListView(
              primary: false,
              padding: const EdgeInsets.only(left: 25.0, right: 20.0),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300,
                    child: ListView(
                      children: [
                        buildFoodItem(
                            'lib/assets/plate1.png', 'Salmon bowl', '\$24.00'),
                        buildFoodItem(
                            'lib/assets/plate2.png', 'Spring bowl', '\$24.00'),
                        buildFoodItem(
                            'lib/assets/plate6.png', 'Avocado bowl', '\$24.00'),
                        buildFoodItem(
                            'lib/assets/plate5.png', 'Berry bowl', '\$24.00'),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 65.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 65.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Icon(Icons.shopping_basket, color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 65.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xFF1C1428)),
                      child: const Center(
                          child: Text('Checkout',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 15.0))),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10,
        top: 10,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(
                  heroTag: imgPath, foodName: foodName, foodPrice: price)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
