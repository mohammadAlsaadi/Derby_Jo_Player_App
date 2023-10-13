import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ListCategories extends StatefulWidget {
  const ListCategories({super.key});

  @override
  State<ListCategories> createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('playgroundInfo').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        return Text('sdsds');
      }
    );
  }
}