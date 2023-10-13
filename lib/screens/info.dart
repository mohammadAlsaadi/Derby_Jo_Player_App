import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/stadiumphoto.png",
              fit: BoxFit.contain,
              width: 411,
              height: 185,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                "The sports stadium includes a stadium with distinctive specifications for football and can accommodate 5-7 players in each team. This is in addition to the world-class facilities. With the stadium, there is a private car park that can accommodate more than 20 cars. Football tournaments are held there, as well as tournaments and sports training are hosted for some centers and schools.",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
              child: Text(
                "\nInformation about the stadium:",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                "\n- The size of the stadium, there are several stadiums (five, six)\n\n\n\n\n",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
