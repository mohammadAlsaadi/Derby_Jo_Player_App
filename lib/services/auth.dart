import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derbyjo/models/checkout.dart';
import 'package:derbyjo/models/comment.dart';
import 'package:derbyjo/models/game.dart';
import 'package:derbyjo/models/player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../main.dart';
import '../models/book.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Players? _userfromFirebase(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? Players(uId: user.uid) : null;
  }

  Stream<Players?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userfromFirebase(user!));
  }

  Future userSignup({
    required String email,
    String? username,
    required String password,
    String? age,
    String? gender,
    String? phoneNo,
    String? fullName,
  }) async {
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
      print(value.user!.email);

      Players model = Players(
          email: email,
          username: username,
          password: password,
          fullName: fullName,
          phoneNo: phoneNo,
          age: age,
          gender: gender,
          uId: value.user!.uid);
      User? user = value.user;
      userCollection.add(model.toMap()).then((value) {
        players.username = model.username;
        players.email = model.email;
        players.password = model.password;
        players.fullName = model.fullName;
        players.phoneNo = model.phoneNo;
        players.age = model.age;
        players.gender = model.gender;
        players.uId = model.uId;
        print(players.username);
        print('success');
      }).catchError((e) {
        print(e.toString());
        _userfromFirebase(user!);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future userLogin({required String email, required String password}) async {
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      User? user = value.user;

      FirebaseFirestore.instance
          .collection('users')
          .doc(value.user?.uid)
          .get()
          .then((value) {
        final uid = players.uId;

        players.username = value.data()?['username'];
        players.email = value.data()?['email'];
        players.password = value.data()?['password'];
        players.phoneNo = value.data()?['phoneNo'];
        players.gender = value.data()?['gender'];
        players.fullName = value.data()?['fullName'];
        print(uid);
        if (uid != null) {
          print("Success Login");
        } else {
          print("Falied Login");
        }
        //getData(uId: uid);
        _userfromFirebase(user!);
      }).catchError((e) {
        print(e.toString());
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future edit({
    required String email,
    required String username,
    required String password,
    String? age,
    String? gender,
    required String phoneNo,
    String? fullName,
  }) async {
    Players model = Players(
        email: email,
        username: username,
        password: password,
        fullName: fullName,
        phoneNo: phoneNo,
        age: age,
        gender: gender,
        uId: players.uId);
    userCollection.doc(players.uId).update(model.toMap()).then((value) {
      players.username = model.username;
      players.email = model.email;
      players.password = model.password;
      players.fullName = model.fullName;
      players.phoneNo = model.phoneNo;
      players.age = model.age;
      players.gender = model.gender;

      print("Edited Success");
    }).catchError((e) {
      print(e.toString());
    });
    //players.username=model.username;
  }

  Future addGame({
    Players? player,
    String? playgroundName,
    String? size,
    String? status,
  }) async {
    FirebaseFirestore.instance
        .collection('game')
        .add(Game(
          playgroundName: playgroundName,
          size: size,
          status: status,
          player: Players(
            username: players.username,
            uId: players.uId,
          ),
        ).toMap())
        .then((value) {
      print("Success add Game");
    });
  }

  Future addBook(
      {String? playgroundName,
      String? size,
      String? status,
      Players? player,
      int? noPlayers,
      double? price,
      String? date,
      String? time}) async {
    Book model = Book(
        noPlayers: noPlayers,
        price: price,
        date: date,
        playgroundName: playgroundName,
        size: size,
        status: status,
        time: time,
        player: Players(
            username: players.username,
            phoneNo: players.phoneNo,
            uId: players.uId));
    FirebaseFirestore.instance
        .collection('Book')
        .add(model.toMap())
        .then((value) {
      book.date = model.date;
      book.noPlayers = model.noPlayers;
      book.price = model.price;
      book.playgroundName = model.playgroundName;
      book.size = model.size;
      book.time = model.time;
      book.status = model.status;
      book.player = Players(
        username: model.player?.username,
        phoneNo: model.player?.phoneNo,
        uId: model.player?.uId,
      );
      print("Booked ");
    });
  }

  Future addComment({
    String? comment,
  }) async {
    FirebaseFirestore.instance
        .collection('Comment')
        .add(Review(comment: comment).toMap())
        .then((value) => print("comment added "));
  }

  Future addCheckout({
    double? totalPrice,
    Players? player,
    Book? book,
  }) async {
    FirebaseFirestore.instance
        .collection('Checkout')
        .add(Checkout(
            totalPrice: totalPrice,
            player: Players(
                username: players.username,
                uId: players.uId,
                phoneNo: players.phoneNo),
            book: Book(
                date: book?.date,
                time: book?.time,
                noPlayers: book!.noPlayers,
                price: book.price,
                playgroundName: book.playgroundName,
                size: book.size,
                status: book.status,
                player: Players(
                  username: book.player?.username,
                  phoneNo: book.player?.phoneNo,
                  uId: book.player?.uId,
                ))).toMap())
        .then((value) => print("Booked "));
  }

/*Future getData({ String? uId,})async{
FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
Players playerModel=Players.formJson(value.data());
print(playerModel.username);

}).catchError((e){
  print(e.toString());
});
}*/

  /*Future registerW(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      //create a new document for the user with the id
      await DataBaseServices(uid: user!.uid).addData(
          player.username,
          player.email,
          player.phoneNo,
          player.password,
          player.fullName,
          player.age,
          player.gender);
      if (!_auth.currentUser!.emailVerified) {
        await _auth.currentUser!.sendEmailVerification();
      }
      return _userfromFirebase(user);
    } catch (e) {
      return null;
    }
  }*/

/*  Future login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userfromFirebase(user!);
    } catch (e) {
      return null;
    }
  }
*/
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
