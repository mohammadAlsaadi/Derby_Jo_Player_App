import 'package:derbyjo/CreatGame.dart';
import 'package:derbyjo/screens/footballCategories.dart';
import 'package:derbyjo/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../utils/constants.dart';
import '../widgets/bottom_menu.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
                            icon: const Icon(
                              LineAwesomeIcons.angle_left,
                              color: mRedColor,
                            ),
                          ),
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
                            color: mBackgroundColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
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
                                  color: mRedColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7, bottom: 10),
                                child: Text(
                                  " search Categories or list ",
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
                          padding: const EdgeInsets.only(left: 30),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(LineAwesomeIcons.filter),
                            color: mRedColor,
                            iconSize: 35,
                          )),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 260, 0),
                  child: Text(
                    category,
                    style: TextStyle(
                        fontSize: 27,
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
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 8.0),
                          child: SizedBox(
                            width: 175,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "images/football2.jpg",
                                  width: 175,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 160,
                                    right: 5,
                                    left: 0,
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Football",
                                          style: TextStyle(
                                              fontSize: 20,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.bold,
                                              color: mBackgroundColor),
                                        ),
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
                                                        const FootballCategories()),
                                              );
                                            },
                                            color: mRedColor,
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
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  child: Row(
                                                    children: const [
                                                      Text(
                                                        "Explore ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                mBackgroundColor,
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
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30, 0, 8.0),
                          child: SizedBox(
                            width: 175,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "images/basketball.jpg",
                                  width: 175,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 160,
                                    right: 5,
                                    left: 0,
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Bsaketball",
                                          style: TextStyle(
                                              fontSize: 20,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.bold,
                                              color: mBackgroundColor),
                                        ),
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
                                                        const Soon()),
                                              );
                                            },
                                            color: mRedColor,
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
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  child: Row(
                                                    children: const [
                                                      Text(
                                                        "Explore ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                mBackgroundColor,
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
                          child: SizedBox(
                            width: 175,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "images/volley.jpeg",
                                  width: 175,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 160,
                                    right: 5,
                                    left: 0,
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Volley",
                                          style: TextStyle(
                                              fontSize: 20,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.bold,
                                              color: mBackgroundColor),
                                        ),
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
                                                        const Soon()),
                                              );
                                            },
                                            color: mRedColor,
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
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  child: Row(
                                                    children: const [
                                                      Text(
                                                        "Explore ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                mBackgroundColor,
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
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 8.0),
                          child: SizedBox(
                            width: 175,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "images/Tennis.jpeg",
                                  width: 175,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 160,
                                    right: 5,
                                    left: 0,
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Tennis",
                                          style: TextStyle(
                                              fontSize: 20,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.bold,
                                              color: mBackgroundColor),
                                        ),
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
                                                        const Soon()),
                                              );
                                            },
                                            color: mRedColor,
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
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  child: Row(
                                                    children: const [
                                                      Text(
                                                        "Explore ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                mBackgroundColor,
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
                          child: SizedBox(
                            width: 175,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "images/Padel.jpeg",
                                  width: 175,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 160,
                                    right: 5,
                                    left: 0,
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Padel",
                                          style: TextStyle(
                                              fontSize: 20,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.bold,
                                              color: mBackgroundColor),
                                        ),
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
                                                        const Soon()),
                                              );
                                            },
                                            color: mRedColor,
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
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  child: Row(
                                                    children: const [
                                                      Text(
                                                        "Explore ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                mBackgroundColor,
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
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 8.0),
                          child: SizedBox(
                            width: 175,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "images/TableTennis.jpeg",
                                  width: 175,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 160,
                                    right: 5,
                                    left: 0,
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Table Tennis",
                                          style: TextStyle(
                                              fontSize: 20,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.bold,
                                              color: mBackgroundColor),
                                        ),
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
                                                        const Soon()),
                                              );
                                            },
                                            color: mRedColor,
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
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  child: Row(
                                                    children: const [
                                                      Text(
                                                        "Explore ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                mBackgroundColor,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateGame()),
          );
        },
        backgroundColor: mBackgroundColor,
        child: const Icon(
          Icons.add,
          color: mRedColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
