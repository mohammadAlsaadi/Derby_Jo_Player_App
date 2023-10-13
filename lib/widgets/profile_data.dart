import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Text(
                snapshot.data!.docs[0]['fullName'],
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              Text(
                snapshot.data!.docs[0]['username'],
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          );
        });
  }
}
