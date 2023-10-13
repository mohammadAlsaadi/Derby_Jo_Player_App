import 'package:derbyjo/screens/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class FootballCategories extends StatefulWidget {
  const FootballCategories({super.key});

  @override
  State<FootballCategories> createState() => _FootballCategoriesState();
}

class _FootballCategoriesState extends State<FootballCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Top Bar
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Image.asset(
                                "images/left.png",
                              )),
                        ),
                      ),
                      //Search
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: 210,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5FAFF),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 236, 155, 155),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Row(
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 11.0, left: 10.0),
                                child: Image(
                                  height: 21,
                                  image: Svg('icons/search.svg'),
                                  color: Color.fromARGB(255, 220, 103, 103),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7, bottom: 10),
                                child: Text(
                                  " search playground ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "images/filter.png",
                                color: Color.fromARGB(255, 220, 103, 103),
                              ))),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 185, 0),
                  child: Text(
                    "Football Playground",
                    style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 8.0),
                          child: Container(
                            width: 175,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "stadiumImages/s1.jpg",
                                  width: 175,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 130,
                                    right: 5,
                                    left: 5,
                                    bottom: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color.fromARGB(255, 255, 254, 254),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Alquaat Almusalahat \n Stadium",
                                            style: TextStyle(
                                                fontSize: 15,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Row(children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Color.fromARGB(
                                                  255, 242, 78, 78),
                                            ),
                                            Text(
                                              "Amman-Jordan",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.black),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, bottom: 0),
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.star_outline_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  Text(
                                                    "5.0",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                30, 0, 30, 0),
                                            child: MaterialButton(
                                              minWidth: 0,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Booking()),
                                                );
                                              },
                                              color: Color.fromARGB(
                                                  255, 218, 44, 93),
                                              elevation: 10,
                                              height: 30,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 0, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Book now",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30, 0, 8.0),
                          child: Container(
                            width: 175,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "stadiumImages/s2.jpg",
                                  width: 175,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 130,
                                    right: 5,
                                    left: 5,
                                    bottom: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color.fromARGB(255, 255, 254, 254),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Al Jazeera Schools \n Stadium",
                                            style: TextStyle(
                                                fontSize: 15,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Row(children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Color.fromARGB(
                                                  255, 242, 78, 78),
                                            ),
                                            Text(
                                              "Amman-Jordan",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.black),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, bottom: 0),
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.star_outline_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  Text(
                                                    "5.0",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                30, 0, 30, 0),
                                            child: MaterialButton(
                                              minWidth: 0,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Booking()),
                                                );
                                              },
                                              color: Color.fromARGB(
                                                  255, 218, 44, 93),
                                              elevation: 10,
                                              height: 30,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 0, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Book now",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 8.0),
                          child: Container(
                            width: 175,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "stadiumImages/s3.jpg",
                                  width: 175,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 130,
                                    right: 5,
                                    left: 5,
                                    bottom: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color.fromARGB(255, 255, 254, 254),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Oxford Schools \n Stadium",
                                            style: TextStyle(
                                                fontSize: 15,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Row(children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Color.fromARGB(
                                                  255, 242, 78, 78),
                                            ),
                                            Text(
                                              "Amman-Jordan",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.black),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, bottom: 0),
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.star_outline_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  Text(
                                                    "5.0",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                30, 0, 30, 0),
                                            child: MaterialButton(
                                              minWidth: 0,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Booking()),
                                                );
                                              },
                                              color: Color.fromARGB(
                                                  255, 218, 44, 93),
                                              elevation: 10,
                                              height: 30,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 0, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Book now",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 8.0),
                          child: Container(
                            width: 175,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "stadiumImages/s4.jpg",
                                  width: 175,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 130,
                                    right: 5,
                                    left: 5,
                                    bottom: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color.fromARGB(255, 255, 254, 254),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Luminous College \n Stadium",
                                            style: TextStyle(
                                                fontSize: 15,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Row(children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Color.fromARGB(
                                                  255, 242, 78, 78),
                                            ),
                                            Text(
                                              "Amman-Jordan",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.black),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, bottom: 0),
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.star_outline_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  Text(
                                                    "5.0",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                30, 0, 30, 0),
                                            child: MaterialButton(
                                              minWidth: 0,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Booking()),
                                                );
                                              },
                                              color: Color.fromARGB(
                                                  255, 218, 44, 93),
                                              elevation: 10,
                                              height: 30,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 0, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Book now",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 8.0),
                          child: Container(
                            width: 175,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "stadiumImages/s5.jpg",
                                  width: 175,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 130,
                                    right: 5,
                                    left: 5,
                                    bottom: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color.fromARGB(255, 255, 254, 254),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Al-Hikma Schools \n Stadium",
                                            style: TextStyle(
                                                fontSize: 15,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Row(children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Color.fromARGB(
                                                  255, 242, 78, 78),
                                            ),
                                            Text(
                                              "Amman-Jordan",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.black),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, bottom: 0),
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.star_outline_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  Text(
                                                    "5.0",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                30, 0, 30, 0),
                                            child: MaterialButton(
                                              minWidth: 0,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Booking()),
                                                );
                                              },
                                              color: Color.fromARGB(
                                                  255, 218, 44, 93),
                                              elevation: 10,
                                              height: 30,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 0, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Book now",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 8.0),
                          child: Container(
                            width: 175,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "stadiumImages/s6.jpg",
                                  width: 175,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 130,
                                    right: 5,
                                    left: 5,
                                    bottom: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color.fromARGB(255, 255, 254, 254),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Alkhudar Schools \n Stadium",
                                            style: TextStyle(
                                                fontSize: 15,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Row(children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Color.fromARGB(
                                                  255, 242, 78, 78),
                                            ),
                                            Text(
                                              "Amman-Jordan",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.black),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, bottom: 0),
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.star_outline_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  Text(
                                                    "5.0",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                30, 0, 30, 0),
                                            child: MaterialButton(
                                              minWidth: 0,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Booking()),
                                                );
                                              },
                                              color: Color.fromARGB(
                                                  255, 218, 44, 93),
                                              elevation: 10,
                                              height: 30,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 0, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Book now",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
