import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derbyjo/screens/book.dart';
import 'package:flutter/material.dart';

import '../CreatGame.dart';
import '../utils/constants.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchText = '';
  List itemList = [];
  List itemPrice = [];
  List itemType = [];
  List itemSize = [];

  List searchResults = [];
  void fetchItemList() async {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('playgroundInfo');
    QuerySnapshot querySnapshot = await collectionRef.get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    setState(() {
      itemList = documents.map((doc) => doc.get('playgroundName')).toList();
      itemPrice = documents.map((doc) => doc.get('price')).toList();
      itemType = documents.map((doc) => doc.get('type')).toList();
      itemSize = documents.map((doc) => doc.get('size')).toList();
    });
  }

  void searchItems(String query) {
    setState(() {
      searchResults = itemList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchItemList();
  }

  /* void navigateToAnotherPage(String item) {
    // Implement your navigation logic here
    // For example, you can use Navigator.push to navigate to another page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnotherPage(item: item),
      ),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 330, top: 30),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: mBlackColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 200,
              top: 20,
            ),
            child: Text(
              "Search for Booking",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
                searchItems(searchText);
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 237, 195, 192),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  hintText: "eg: oxford stadium ",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ),
          ),
          Expanded(
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
                  return ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final item = searchResults[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            i = index;
                            print(i);
                          });

                          //print(index);
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'images/playground.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.price_change,
                                                color: Colors.redAccent,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                snapshot.data!.docs[i]['price']
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.sports_soccer,
                                                color: Colors.redAccent,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                snapshot.data!.docs[i]['size']
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        mBackgroundColor),
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(mRedColor),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Booking()),
                                                );
                                              },
                                              child: Text('Book'))
                                        ],
                                      ),
                                      /* const SizedBox(height: 8),
                                  Text(
                                    date.toString(),
                                    style: const TextStyle(fontSize: 12),
                                  ),*/
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      )),
    );
  }
}
