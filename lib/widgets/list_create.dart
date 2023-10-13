import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'list_data.dart';

class ListCreate extends StatefulWidget {
  const ListCreate({super.key});

  @override
  State<ListCreate> createState() => _ListCreateState();
}

class _ListCreateState extends State<ListCreate> {
  int selectedOptionIndex = -1;

  void selectOption(int index) {
    setState(() {
      selectedOptionIndex = index;
    });
  }

  int selectedStatusIndex = -1;

  void selectStatus(int index) {
    setState(() {
      selectedStatusIndex = index;
    });
  }

  final List<String> imagesStadium = [
    "stadiumImages/s1.jpg",
    "stadiumImages/s2.jpg",
    "stadiumImages/s3.jpg",
    "stadiumImages/s4.jpg",
    "stadiumImages/s5.jpg",
    "stadiumImages/s6.jpg",
    "stadiumImages/s7.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('playgroundInfo').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.size,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    selectOption(index);
                    setState(() {
                      i=index;
                      print(i);
                      //print(index);
                    });
                  },
                  child: Card(
                    color: selectedOptionIndex == index
                        ? mRedColor
                        : mBackgroundColor,
                    child: Stack(
                      children: [
                        const Text(
                          "Select Stadium",
                          style: TextStyle(
                              fontSize: 20,
                              color: mRedColor,
                              shadows: [
                                Shadow(
                                  color: Color.fromARGB(255, 208, 208, 208),
                                  offset: Offset(1, 1),
                                  blurRadius: 10,
                                ),
                              ],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 150,
                          child: Column(
                            children: [
                              Image.asset(
                                imagesStadium[index],
                                width: 165,
                                height: 170,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 130, left: 4),
                              child: Text(
                                snapshot.data!.docs[index]['playgroundName'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      offset: Offset(10, 5),
                                      blurRadius: 100,
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
              );
            },
          );
        });
  }
}

/*Future id(String id) async {
  DocumentReference doc_ref =
      FirebaseFirestore.instance.collection("playgroundInfo").doc();
  DocumentSnapshot docSnap = await doc_ref.get();
  playgroundID = docSnap.reference.id;
  print(playgroundID);
  return playgroundID;
}*/
