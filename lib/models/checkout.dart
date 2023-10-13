import 'package:derbyjo/models/player.dart';

import 'book.dart';

class Checkout {
  double? totalPrice;
  Players? player;
  Book? book;

  Checkout({
    this.totalPrice,
    this.player,
    this.book,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': player?.username,
      'player Id': player?.uId,
      'player phone': player?.phoneNo,
      'playgroundName': book?.playgroundName,
      'totalPrice': totalPrice,
      'size': book?.size,
      'status': book?.status,
      'NoPlayers': book?.noPlayers,
      'date': book?.date,
      'time': book?.time,
    };
  }
}
