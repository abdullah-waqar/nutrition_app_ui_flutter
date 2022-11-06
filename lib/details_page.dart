import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  DetailsPage(
      {Key? key,
      required this.heroTag,
      required this.foodName,
      required this.foodPrice})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = "WEIGHT";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF7A9BEE),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "Details",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: const Icon(Icons.more_horiz))
          ],
        ),
        body: ListView(children: [
          Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height - 82.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
            ),
            Positioned(
              top: 75,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                  color: Colors.white,
                ),
              ),
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
                top: 30,
                left: MediaQuery.of(context).size.width / 2 - 100,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.heroTag),
                            fit: BoxFit.cover)),
                  ),
                )),
            Positioned(
              top: 250.0,
              left: 25.0,
              right: 25.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.foodName,
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.foodPrice,
                          style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              color: Colors.grey)),
                      Container(height: 25.0, color: Colors.grey, width: 1.0),
                      Container(
                        width: 125.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: const Color(0xFF7A9BEE)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: const Color(0xFF7A9BEE)),
                                child: const Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            const Text('2',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0)),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.white),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xFF7A9BEE),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildInfoCard("WEIGHT", "300", "G"),
                        const SizedBox(
                          width: 10.0,
                        ),
                        buildInfoCard("CALORIES", "267", "CAL"),
                        const SizedBox(
                          width: 10.0,
                        ),
                        buildInfoCard("VITAMINS", "A, B6", "VIT"),
                        const SizedBox(
                          width: 10.0,
                        ),
                        buildInfoCard("AVAIL", "NO", "AV"),
                        const SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height - 700),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0)),
                          color: Colors.black),
                      height: 50.0,
                      child: const Center(
                        child: Text('\$52.00',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat')),
                      ),
                    ),
                  )
                ],
              ),
            )
          ])
        ]));
  }

  Widget buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cardTitle == selectedCard
                  ? const Color(0xFF7A9BEE)
                  : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 100.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: cardTitle == selectedCard
                              ? Colors.white
                              : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: cardTitle == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                            ))
                      ],
                    ),
                  )
                ])));
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
