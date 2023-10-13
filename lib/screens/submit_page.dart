import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derbyjo/models/book.dart';
import 'package:derbyjo/models/game.dart';
import 'package:derbyjo/models/player.dart';
import 'package:derbyjo/screens/facuilities.dart';
import 'package:derbyjo/screens/home/home.dart';
import 'package:derbyjo/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../main.dart';
import '../widgets/list_data.dart';

double totalPrice = 0;

class SubmitPage extends StatefulWidget {
  const SubmitPage({super.key});

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

enum Payment { visa, cash }

class _SubmitPageState extends State<SubmitPage> {
  final AuthService _auth = AuthService();
  dynamic item = 0;
  Payment? _payment = Payment.cash;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined,
                        color: Colors.red),
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
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          snapshot.data!.docs[i]['playgroundName'],
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 100, 0, 0),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('playgroundInfo')
                  .snapshots(),
              builder: (context, snapshot) {
                totalPrice = snapshot.data!.docs[i]['price'] +
                    waterPrice +
                    gatoradePrice;
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 229, 229),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 222, 20),
                        child: Text(
                          "Payement",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 3, 0, 10),
                            child: Text(
                              "Playground Price",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(150, 3, 0, 10),
                            child: Text(
                              snapshot.data!.docs[i]['price'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  decoration: TextDecoration.none,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 3, 0, 10),
                            child: Text(
                              "Gatorade",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(220, 3, 0, 10),
                            child: Text(
                              gatoradePrice.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  decoration: TextDecoration.none,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 3, 0, 10),
                            child: Text(
                              "Water",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(241, 3, 0, 10),
                            child: Text(
                              waterPrice.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  decoration: TextDecoration.none,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                            child: Text(
                              "Total Cost",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(185, 15, 0, 0),
                            child: Text(
                              totalPrice.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  decoration: TextDecoration.none,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 330, 0, 0),
          child: Container(
            child: Column(
              children: [
                Text(
                  "Payement methods",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(197, 1, 40, 71),
                    decoration: TextDecoration.none,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 355, 0, 0),
          child: Container(
            height: 200,
            width: 350,
            child: Material(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: ListTile(
                      title: Text('Cash'),
                      leading: Radio<Payment>(
                        value: Payment.cash,
                        groupValue: _payment,
                        onChanged: (value) {
                          setState(() {
                            _payment = value;
                          });
                        },
                      ),
                      trailing: Icon(Icons.money_rounded),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                    child: ListTile(
                      title: Text('Visa'),
                      leading: Radio<Payment>(
                        value: Payment.visa,
                        groupValue: _payment,
                        onChanged: (value) {
                          setState(() {
                            _payment = value;
                          });
                        },
                      ),
                      trailing: Icon(Icons.payment),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 475, 0, 0),
          child: Container(
            child: Column(
              children: [
                Text(
                  "Discount code",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(197, 1, 40, 71),
                    decoration: TextDecoration.none,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 510, 20, 0),
          child: Material(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter Code here',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                prefixIcon: Icon(Icons.discount_rounded),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 590, 0, 0),
          child: ElevatedButton(
            onPressed: () async {
              _auth.addCheckout(
                  totalPrice: totalPrice,
                  player: Players(
                      username: players.username,
                      phoneNo: players.phoneNo,
                      uId: players.uId),
                  book: Book(
                      date: book.date,
                      noPlayers: book.noPlayers,
                      price: book.price,
                      playgroundName: book.playgroundName,
                      size: book.size,
                      status: book.size,
                      time: book.time,
                      player: Players(
                        username: book.player?.username,
                        phoneNo: book.player?.phoneNo,
                        uId: book.player?.uId,
                      )));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Conferm()),
              );
            },
            child: Text('Submit'),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(335, 50),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.red),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Conferm extends StatefulWidget {
  const Conferm({super.key});

  @override
  State<Conferm> createState() => _ConfermState();
}

class _ConfermState extends State<Conferm> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 190),
                child: Image.asset(
                  "images/conferm.png",
                  width: 500,
                  height: 200,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "The Booking is Completed ..",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontFamily: AutofillHints.countryName,
                    shadows: [
                      Shadow(
                        color: Color.fromARGB(255, 204, 204, 204),
                        offset: Offset(3, 3),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(90, 50, 90, 25),
                child: MaterialButton(
                  minWidth: 0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );

                    final snackBar = SnackBar(
                      content: Text('The Booking updated !'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  color: Color.fromARGB(255, 241, 61, 61),
                  elevation: 10,
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Back to home page",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
