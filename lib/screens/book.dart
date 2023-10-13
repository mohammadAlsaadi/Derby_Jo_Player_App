import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derbyjo/models/game.dart';
import 'package:derbyjo/models/player.dart';
import 'package:derbyjo/screens/check_out.dart';
import 'package:derbyjo/services/auth.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:derbyjo/main.dart';

import '../utils/constants.dart';
import '../widgets/list_data.dart';
import 'date_picker.dart';

int selectedDay = -1;
String Days = '';
int selectedTime = -1;
String time = '';

final AuthService _auth = AuthService();
int numberOfPlayer = 0;
int numberOfPlayer2 = 0;
String size = '';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  /*DateTime? dateSelected;

  void fetchItemList() async {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('Book');
    QuerySnapshot querySnapshot = await collectionRef.get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    setState(() {
      dateSelected = documents.map((doc) => doc.get('date')) as DateTime?;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchItemList();
  }*/

  late int numPlyer;

  void _updateFillCount2(int count) {
    setState(() {
      numberOfPlayer2 = count;
      size = '6X6';
    });
  }

  void _updateFillCount(int count) {
    setState(() {
      numberOfPlayer = count;
      size = '5X5';
    });
  }

  List<Widget> _buildIconRows() {
    List<Widget> iconRows = [];
    List<IconButton> iconButtons = [];

    for (int i = 0; i < 10; i++) {
      iconButtons.add(
        IconButton(
          icon: Icon(
            Icons.person,
            size: 65,
            color: i < numberOfPlayer ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _updateFillCount(i + 1);
            });
          },
        ),
      );

      if (iconButtons.length == 5 || i == 9) {
        iconRows.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 30, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: iconButtons,
            ),
          ),
        );
        iconButtons = [];
      }
    }

    return iconRows;
  }

  List<Widget> _buildIconRows2() {
    List<Widget> iconRows2 = [];
    List<IconButton> iconButtons2 = [];

    for (int i = 0; i < 12; i++) {
      iconButtons2.add(
        IconButton(
          icon: Icon(
            Icons.person,
            size: 65,
            color: i < numberOfPlayer2 ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            _updateFillCount2(i + 1);
          },
        ),
      );

      if (iconButtons2.length == 6 || i == 11) {
        iconRows2.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 30, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: iconButtons2,
            ),
          ),
        );
        iconButtons2 = [];
      }
    }

    return iconRows2;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(children: [
      Container(
        width: 411,
        height: 250,
        color: mBackgroundColor,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Image.asset(
                "images/stadiumphoto.png",
                fit: BoxFit.fill,
                width: 411,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 10, 0),
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 11, 0, 0),
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
              ),
            )
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(20, 170, 20, 0),
          child: SingleChildScrollView(
              child: Container(
            decoration: BoxDecoration(
                color: mBackgroundColor,
                borderRadius: BorderRadius.circular(17)),
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
                  return Column(
                    children: [
                      Padding(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(130, 10, 0, 0),
                        child: Row(children: const [
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
                        padding: const EdgeInsets.fromLTRB(130, 5, 0, 0),
                        child: Row(children: [
                          Row(
                            children: const [
                              Text(
                                "Open",
                                style: TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                    color: mBlackColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  "10am - 2am",
                                  style: TextStyle(
                                      fontSize: 12,
                                      decoration: TextDecoration.none,
                                      color: mBlackColor),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(120, 3, 0, 0),
                        child: Row(children: const [
                          Icon(
                            Icons.location_on_outlined,
                            color: mYellow,
                          ),
                          Text(
                            "2.5 km",
                            style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.none,
                                color: mBackgroundColor),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              "5.0",
                              style: TextStyle(
                                fontSize: 10,
                                color: mBlackColor,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.star_outline_rounded,
                            color: mYellow,
                          ),
                        ]),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Container(
                                  height: 200,
                                  width: 350,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "images/stadiumtraning.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      ..._buildIconRows(),
                                      SizedBox(height: 16),
                                      Text(
                                        'Number of player: $numberOfPlayer',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  )),
                            ),
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('Book')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                    child: Container(
                                        height: 200,
                                        width: 350,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "images/stadiumtraning.jpg"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            ..._buildIconRows2(),
                                            SizedBox(height: 16),
                                            Text(
                                              'Number of player: $numberOfPlayer2',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        )),
                                  );
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 200, top: 30),
                        child: Text(
                          "Booking Day :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(height: 150, width: 400, child: Date()),
                      Padding(
                        padding: const EdgeInsets.only(right: 200, top: 30),
                        child: Text(
                          "Booking Time :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(height: 150, width: 400, child: Time()),
                      // Checkdate(),
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
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(52, 0, 40, 25),
                                  child: MaterialButton(
                                    minWidth: 0,
                                    onPressed: () async {
                                      _auth.addBook(
                                          date: Days,
                                          time: time,
                                          playgroundName: snapshot.data!.docs[i]
                                              ['playgroundName'],
                                          player: Players(
                                              username: players.username,
                                              phoneNo: players.phoneNo),
                                          size: size,
                                          price: snapshot.data!.docs[i]
                                              ['price'],
                                          noPlayers: numberOfPlayer);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CheckOut()),
                                      );
                                    },
                                    color:
                                        const Color.fromARGB(255, 241, 61, 61),
                                    elevation: 10,
                                    height: 50,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: const [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(70, 0, 0, 0),
                                          child: Text(
                                            "Book a game",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  );
                }),
          )))
    ]));
  }
}

class Date extends StatefulWidget {
  const Date({super.key});

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  final List<String> days = ['sun', 'mon', 'tue', 'wed', 'thr', 'fri', 'sat'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              itemBuilder: (BuildContext context, int position) {
                return InkWell(
                  onTap: () {
                    setState(() => selectedDay = position);
                    Days = days[selectedDay];
                    print(Days);
                  },
                  child: Container(
                    width: 150,
                    child: Card(
                      shape: (selectedDay == position)
                          ? RoundedRectangleBorder(
                              side: BorderSide(color: Colors.red))
                          : null,
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('${days[position]}'),
                          // Icon(iconList[position].titleIcon)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  final List<String> times = [
    '2-4 pm',
    '4-6 pm',
    '6-8 pm',
    '8-10 pm',
    '10-12 pm',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: times.length,
              itemBuilder: (BuildContext context, int position) {
                return InkWell(
                  onTap: () {
                    setState(() => selectedDay = position);
                    time = times[selectedDay];
                    print(time);
                  },
                  child: Container(
                    width: 150,
                    child: Card(
                      shape: (selectedDay == position)
                          ? RoundedRectangleBorder(
                              side: BorderSide(color: Colors.red))
                          : null,
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('${times[position]}'),
                          // Icon(iconList[position].titleIcon)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
