import 'package:derbyjo/models/player.dart';

class Game {
  Players? player;
  String? playgroundName;
  String? size;
  String? status;
  String? gameId;

  Game({
    this.player,
    this.playgroundName,
    this.size,
    this.status,
    this.gameId,
  });

  Game.formJson(Map<String, dynamic>? json) {
    player?.username = json?['username'];
    player?.uId = json?['player Id'];
    playgroundName = json?['playgroundName'];
    size = json?['size'];
    status = json?['status'];
    gameId = json?['gameId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'username': player?.username,
      'player Id': player?.uId,
      'playgroundName': playgroundName,
      'size': size,
      'status': status,
      'gameId': gameId,
    };
  }
}
