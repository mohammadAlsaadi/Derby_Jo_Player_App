import 'package:derbyjo/models/book.dart';
import 'package:derbyjo/models/player.dart';
import 'package:derbyjo/screens/authenication/get_started.dart';
import 'package:derbyjo/screens/home/home.dart';
import 'package:derbyjo/services/auth.dart';
import 'package:derbyjo/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

final Players players = Players();
final Book book = Book();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Players?>.value(
      value: AuthService().user,
      initialData: null,
      child: const MaterialApp(
        home: GetStart(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
