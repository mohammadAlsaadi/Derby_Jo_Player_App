import 'package:derbyjo/screens/activity.dart';
import 'package:derbyjo/screens/authenication/get_started.dart';
import 'package:derbyjo/screens/categories.dart';
import 'package:derbyjo/screens/profile.dart';
import 'package:derbyjo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../../CreatGame.dart';
import '../../utils/constants.dart';
import '../../widgets/bottom_menu.dart';
import '../../widgets/list_data.dart';
import 'package:derbyjo/screens/footballCategories.dart';

final AuthService _auth = AuthService();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Top Bar
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            shape: const CircleBorder(),
                            backgroundColor: mRedColor,
                          ),
                          child: const ClipOval(
                            child: Image(
                              image: AssetImage('images/pro.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      //Search
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: 210,
                          height: 45,
                          decoration: BoxDecoration(
                            color: mBackgroundColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: boxColor,
                                offset: Offset(0, 10),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Row(
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 11.0, left: 10.0),
                                child: Image(
                                  height: 21,
                                  image: Svg('icons/search.svg'),
                                  color: mRedColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Image(
                          image: Svg('icons/notification.svg'),
                          height: 30,
                          color: mRedColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Text(
                        category,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, right: 5),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: mRedColor,
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Categories()),
                          );
                        },
                        child: const Text(seeAll),
                      ),
                    ),
                  ],
                ),
                //Category
                Container(
                  height: 134,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 30,
                        color: shadowColor,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FootballCategories()),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Image.asset('images/football.png'),
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'Football',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Soon()),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Image.asset('images/basketball.png'),
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'Basketball',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Soon()),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Image.asset('images/tennis.png'),
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'Tennis',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Soon()),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Image.asset('images/paddel.png'),
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'Padel',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Soon()),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Image.asset('images/swimmingg.png'),
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'Swimming',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Suggested
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        suggested,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, right: 5),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: mRedColor,
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Activity()),
                          );
                        },
                        child: const Text(seeAll),
                      ),
                    ),
                  ],
                ),
                // List Card
                Container(
                  height: 410,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: const HomeList(),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: mBackgroundColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 140,
                            width: 170,
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              'images/basketball.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 82,
                              height: 35,
                              alignment: Alignment.center,
                              child: MaterialButton(
                                onPressed: null,
                                color: mRedColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.person,
                                      color: mRedColor,
                                    ),
                                    Text(
                                      '?/10',
                                      style: TextStyle(
                                          color: mBackgroundColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const Text(
                              //   'Today from 10-11pm',
                              //   style: TextStyle(
                              //     fontSize: 18,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    'Basketball Game',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Icon(
                                    Icons.sports_soccer,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star_border, color: Colors.orange),
                                  Icon(Icons.star_border, color: Colors.orange),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.location_on,
                                        color: mRedColor,
                                      ),
                                      Text(
                                        '2.1 km',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.red,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Comming soon",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateGame()),
          );
        },
        backgroundColor: mBackgroundColor,
        child: const Icon(
          Icons.add,
          color: mRedColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomMenu(),
    );
  }
}

class Soon extends StatefulWidget {
  const Soon({super.key});

  @override
  State<Soon> createState() => _SoonState();
}

class _SoonState extends State<Soon> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
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
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset("images/Coming-Soon.jpg"),
            ),
            const Padding(
              padding: EdgeInsets.all(100.0),
              child: Text("Coming Soon ..",
                  style: TextStyle(
                      fontSize: 25,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
