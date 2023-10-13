import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derbyjo/utils/constants.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Comment').snapshots(),
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
                padding: const EdgeInsets.only(bottom: 45.0),
                child: Container(
                  color: const Color.fromARGB(255, 241, 206, 203),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              "images/moalsaaadi.jpeg",
                              width: 50,
                              height: 50,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "water",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: mBlackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                        child: Row(
                          children: [
                            Text(snapshot.data!.docs[index]['comment']),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.star_outline_rounded,
                              color: mYellow,
                            ),
                            Text(
                              "4.5",
                              style: TextStyle(
                                fontSize: 10,
                                color: mBlackColor,
                                decoration: TextDecoration.none,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
