import 'dart:async';

import 'package:balloon_game/balloon.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame {
  int score = 0;
  late TextComponent scoreText;

  @override
  Color backgroundColor() => Colors.lightGreenAccent;

  @override
  FutureOr<void> onLoad() {
    scoreText =
        TextComponent(text: 'Puntuación: $score', position: Vector2(10, 10));
    add(scoreText);
    add(Balloon());
  }

  void increaseScore() {
    score++;
    scoreText.text = 'Puntuación: $score';
  }
}
