import 'package:derbyjo/models/game.dart';
import 'package:derbyjo/models/player.dart';
import 'package:flutter/material.dart';

class Book {
  String? playgroundName;
  String? size;
  String? status;
  Players? player;
  String? time;
  int? noPlayers;
  double? price;
  String? date;

  Book({
    this.playgroundName,
    this.size,
    this.status,
    this.noPlayers,
    this.player,
    this.price,
    this.date,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'playgoundName': playgroundName,
      'Number of Players': noPlayers,
      'price': price,
      'date': date,
      'time': time,
      'Player Name': player?.username,
      'Phone number': player?.phoneNo,
      'PlayerId': player?.uId,
    };
  }
}
