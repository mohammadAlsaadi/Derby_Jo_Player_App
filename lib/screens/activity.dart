import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derbyjo/screens/rating.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

import 'book.dart';

int currentTab = 0;

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  int index = 0;

  List pages = [
    const Upcoming(),
    const past(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Padding(
                padding: const EdgeInsets.only(right: .0),
                child: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 20,
                  color: mBlackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                "Activity",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          NavigationBar(
            elevation: 0,
            height: 70,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                label: "Upcoming Activity",
                icon: Icon(Icons.source_outlined),
              ),
              NavigationDestination(
                label: "Past Activity",
                icon: Icon(Icons.paste_outlined),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
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
        ],
      ),
    );
  }
}

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Checkout').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.size,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Image.asset(
                                          'stadiumImages/s2.jpg',
                                          height: 150,
                                          width: 170,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  ['playgroundName'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                decoration: TextDecoration.none,
                                                fontSize: 19,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 0, 0, 0),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Text('Amman, Jordan'),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                25, 5, 0, 0),
                                            child: MaterialButton(
                                              minWidth: 0,
                                              onPressed: () {},
                                              color: Colors.red,
                                              elevation: 10,
                                              height: 45,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 0, 0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "${snapshot.data!.docs[index]['date']} from \n ${snapshot.data!.docs[index]['time']}",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}

class past extends StatefulWidget {
  const past({super.key});

  @override
  State<past> createState() => _pastState();
}

class _pastState extends State<past> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 229, 229),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Image.asset(
                                          'stadiumImages/s4.jpg',
                                          height: 150,
                                          width: 170,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              'ملعب الوحدة ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                decoration: TextDecoration.none,
                                                fontSize: 19,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          const Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 0, 0, 0),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Text('Amman, Jordan'),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  '3/6/2023\n6pm - 8pm',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                MaterialButton(
                                                  minWidth: 0,
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Rating()),
                                                    );
                                                  },
                                                  color: const Color.fromARGB(
                                                      255, 218, 44, 93),
                                                  elevation: 10,
                                                  height: 30,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 0, 0, 0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Rate now !",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .white,
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
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 180, 10, 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Image.asset(
                                          'stadiumImages/s6.jpg',
                                          height: 150,
                                          width: 170,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                35, 0, 0, 0),
                                            child: Text(
                                              ' ملعب الحسين ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                decoration: TextDecoration.none,
                                                fontSize: 19,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    30, 0, 0, 0),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Text('Irbid, Jordan'),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  '3/6/2023\n6pm - 8pm',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                MaterialButton(
                                                  minWidth: 0,
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Rating()),
                                                    );
                                                  },
                                                  color: const Color.fromARGB(
                                                      255, 218, 44, 93),
                                                  elevation: 10,
                                                  height: 30,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 0, 0, 0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Rate now !",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .white,
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
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 350, 10, 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Image.asset(
                                          'stadiumImages/s1.jpg',
                                          height: 150,
                                          width: 170,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              "ملعب مدارس الخضر",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                decoration: TextDecoration.none,
                                                fontSize: 19,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    30, 0, 0, 0),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Text('Zarqa, Jordan'),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  '3/6/2023\n6pm - 8pm',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                MaterialButton(
                                                  minWidth: 0,
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Rating()),
                                                    );
                                                  },
                                                  color: const Color.fromARGB(
                                                      255, 218, 44, 93),
                                                  elevation: 10,
                                                  height: 30,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 0, 0, 0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Rate now !",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .white,
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
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 520, 10, 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Image.asset(
                                          'stadiumImages/s2.jpg',
                                          height: 150,
                                          width: 170,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                35, 0, 0, 0),
                                            child: Text(
                                              'ملعب شفا بدران',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                decoration: TextDecoration.none,
                                                fontSize: 19,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    30, 0, 0, 0),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Text('Amman, Jordan'),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  '15/6/2023\n8pm - 10pm',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                MaterialButton(
                                                  minWidth: 0,
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Rating()),
                                                    );
                                                  },
                                                  color: const Color.fromARGB(
                                                      255, 218, 44, 93),
                                                  elevation: 10,
                                                  height: 30,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 0, 0, 0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Rate now !",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .white,
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
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// StreamBuilder(
//             stream =
//                 FirebaseFirestore.instance.collection('Checkout').snapshots(),
//             builder: (context, snapshot) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.size,
//                 itemBuilder: (context, index) {
//                   if (!snapshot.hasData) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   return Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 20),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.asset(
//                               'images/Rectangle 2.png',
//                               width: 100,
//                               height: 100,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   snapshot.data!.docs[index]['playgroundName'],
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.sports_soccer,
//                                       color: Colors.redAccent,
//                                     ),
//                                     const SizedBox(width: 5),
//                                     Text(
//                                       snapshot.data!.docs[index]['size'],
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   snapshot.data!.docs[index]['date'].toString(),
//                                   style: const TextStyle(fontSize: 12),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 RichText(
//                                   text: TextSpan(
//                                     text: 'Price: ',
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                       color: Colors.black,
//                                     ),
//                                     children: [
//                                       TextSpan(
//                                         text: snapshot
//                                             .data!.docs[index]['totalPrice']
//                                             .toString(),
//                                         style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14,
//                                           color: Colors.green,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),