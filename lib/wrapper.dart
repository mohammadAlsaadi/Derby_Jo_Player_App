import 'package:derbyjo/models/player.dart';
import 'package:derbyjo/screens/authenication/get_started.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    Players? user = Provider.of<Players?>(context);
    if (user == null) {
      return const GetStart();
    } else {
      return const Home();
    }
  }
}
