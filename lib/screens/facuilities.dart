import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derbyjo/utils/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/list_create.dart';
import '../widgets/list_data.dart';

dynamic gatoradePrice = 0;
dynamic waterPrice = 0;
dynamic item = 0;
dynamic item1 = 0;
dynamic item2 = 0;

class Facuilities extends StatefulWidget {
  const Facuilities({super.key});

  @override
  State<Facuilities> createState() => _FacuilitiesState();
}

class _FacuilitiesState extends State<Facuilities> {
  dynamic item3 = 0;
  dynamic item4 = 0;
  dynamic sale = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Facilities').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Image.asset(
                          "images/gato.jpg",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          children: [
                            Text(
                              snapshot.data!.docs[i]['gatorade'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              snapshot.data!.docs[i]['gatoradePrice']
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.local_offer_outlined,
                                  color: mRedColor,
                                ),
                                Text("0% Discount"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 130, 10, 0),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: mRedColor),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      item1 -= 1;

                                      if (item1 == 0) {
                                        gatoradePrice = snapshot.data!.docs[i]
                                                ['gatoradePrice'] *
                                            item1;
                                      } else {
                                        gatoradePrice -= snapshot.data!.docs[i]
                                            ['gatoradePrice'];
                                      }
                                      item = item1 + item2;
                                      print(item);
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove_outlined,
                                    color: mBackgroundColor,
                                    size: 20,
                                  )),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: mBackgroundColor),
                                child: Text(
                                  "$item1",
                                  style: const TextStyle(
                                      color: mBlackColor, fontSize: 15),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      item1 += 1;
                                      if (item1 == 0) {
                                        gatoradePrice = snapshot.data!.docs[i]
                                                ['gatoradePrice'] *
                                            item1;
                                      } else {
                                        gatoradePrice += snapshot.data!.docs[i]
                                            ['gatoradePrice'];
                                      }
                                      item = item1 + item2;
                                      print(item);
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: mBackgroundColor,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Image.asset(
                          "images/water.jpg",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              snapshot.data!.docs[i]['water'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              snapshot.data!.docs[i]['waterPrice'].toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.local_offer_outlined,
                                  color: mRedColor,
                                ),
                                Text("0% Discount")
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 130, 10, 0),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: mRedColor),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      item2 -= 1;
                                      if (item2 == 0) {
                                        waterPrice = snapshot.data!.docs[i]
                                                ['waterPrice'] *
                                            item2;
                                      } else {
                                        waterPrice -= snapshot.data!.docs[i]
                                            ['waterPrice'];
                                      }
                                      item = item1 + item2;
                                      print(item);
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove_outlined,
                                    color: mBackgroundColor,
                                    size: 20,
                                  )),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: mBackgroundColor),
                                child: Text(
                                  "$item2",
                                  style: const TextStyle(
                                      color: mBlackColor, fontSize: 15),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      item2 += 1;
                                      if (item2 == 0) {
                                        waterPrice = snapshot.data!.docs[i]
                                                ['waterPrice'] *
                                            item2;
                                      } else {
                                        waterPrice += snapshot.data!.docs[i]
                                            ['waterPrice'];
                                      }
                                      item = item1 + item2;
                                      print(item);
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: mBackgroundColor,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Image.asset(
                          "images/kut.png",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            Text(
                              snapshot.data!.docs[i]['kit'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Text(
                              "Free",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(75, 110, 10, 0),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: mRedColor),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      item3 -= 1;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove_outlined,
                                    color: mBackgroundColor,
                                    size: 20,
                                  )),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: mBackgroundColor),
                                child: Text(
                                  "$item3",
                                  style: const TextStyle(
                                      color: mBlackColor, fontSize: 15),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      item3 += 1;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: mBackgroundColor,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Image.asset(
                          "images/cuty.jpg",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              snapshot.data!.docs[i]['kit'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Text(
                              "Free",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(120, 110, 10, 60),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: mRedColor),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      item4 -= 1;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove_outlined,
                                    color: mBackgroundColor,
                                    size: 20,
                                  )),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: mBackgroundColor),
                                child: Text(
                                  "$item4",
                                  style: const TextStyle(
                                      color: mBlackColor, fontSize: 15),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      item4 += 1;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: mBackgroundColor,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          );
        });
  }
}
/*Badge(
            position: BadgePosition.topEnd(top: 3, end: 3),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeColor: Colors.white,
            toAnimate: true,
            badgeContent: Text(
              '5',
              style: TextStyle(
                  fontSize: 8,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),*/
