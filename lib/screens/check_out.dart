import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derbyjo/screens/facuilities.dart';
import 'package:derbyjo/screens/info.dart';
import 'package:derbyjo/screens/review.dart';
import 'package:derbyjo/screens/submit_page.dart';
import 'package:derbyjo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

import '../widgets/list_data.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  bool isFavorite = false;
  dynamic sale = 0;
  int index = 0;

  List pages = [const Facuilities(), const Reviews(), const Info()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            width: 411,
            height: 200,
            color: mRedColor,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Image.asset(
                    "images/stadiumphoto.png",
                    fit: BoxFit.fill,
                    width: 411,
                    height: 185,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          "images/left.png",
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: FavoriteButton(
                      iconSize: 40,
                      isFavorite: true,
                      // iconDisabledColor: Colors.white,
                      valueChanged: (isFavorite) {
                        // ignore: avoid_print
                        print('Is Favorite : $isFavorite');
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: mBackgroundColor,
                  borderRadius: BorderRadius.circular(17)),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(350, 0, 0, 0),
                  child: SizedBox(
                    height: 25,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.star_outline_rounded,
                          color: mYellow,
                        ),
                        Text(
                          "5.0",
                          style: TextStyle(
                            fontSize: 10,
                            color: mBlackColor,
                            decoration: TextDecoration.none,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('playgroundInfo')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: SizedBox(
                          height: 30,
                          child: Text(snapshot.data!.docs[i]['playgroundName'],
                              style: TextStyle(
                                  fontSize: 25,
                                  decoration: TextDecoration.none,
                                  color: mBlackColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(155, 0, 0, 0),
                  child: Row(children: const [
                    Icon(
                      Icons.location_on_outlined,
                      color: mBlackColor,
                    ),
                    Text(
                      "Amman-Jordan",
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          color: mBlackColor),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                  child: Row(children: const [
                    Text(
                      "2.5 km",
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          color: mBlackColor),
                    ),
                  ]),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 265, 0, 0),
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Scaffold(
                  backgroundColor: const Color.fromARGB(255, 208, 208, 208),
                  body: NavigationBar(
                      elevation: 0,
                      height: 60,
                      selectedIndex: index,
                      onDestinationSelected: (index) =>
                          setState(() => this.index = index),
                      destinations: [
                        NavigationDestination(
                            icon: Image.asset(
                              "images/fac1.png",
                              width: 80,
                              fit: BoxFit.fill,
                            ),
                            label: ""),
                        NavigationDestination(
                            icon: Image.asset(
                              "images/rev9.png",
                              width: 80,
                              fit: BoxFit.fill,
                            ),
                            label: ""),
                        NavigationDestination(
                            icon: Image.asset(
                              "images/info9.png",
                              width: 80,
                              fit: BoxFit.fill,
                            ),
                            label: ""),
                      ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 345, 0, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Scaffold(
                backgroundColor: const Color.fromARGB(255, 229, 229, 229),
                body: Center(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      pages[index],
                    ]),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 620, 80, 0),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('playgroundInfo')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return MaterialButton(
                    minWidth: 0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SubmitPage()),
                      );
                    },
                    color: mRedColor,
                    elevation: 10,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(75, 0, 0, 0),
                          child: Text(
                            "checkout",
                            style: TextStyle(
                                fontSize: 18,
                                color: mBackgroundColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
