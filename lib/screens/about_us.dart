import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "About DERBY JO ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 0, 8),
              child: Image.asset("images/dj2.png"),
            )
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.grey,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Throughout the past century, people who want to practice sports used the traditional method of booking playgrounds, in which they either reserve a playground at specific times and locations or with specific individuals.",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontFamily: AutofillHints.addressCity),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "It takes a lot of time and effort for some people who are passionate about sports to try to find suitable people to practice sports with, as well as suitable places like playgrounds, by randomly searching groups on social networking sites, searching in nearby places, or asking people close to them. Booking playgrounds and finding people to play sports online has become an increasingly popular activity worldwide duo to the rapid development of today’s technology and the widespread availability of the internet.",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontFamily: AutofillHints.addressCity),
            ),
          ),
        ],
      ),
    );
  }
}