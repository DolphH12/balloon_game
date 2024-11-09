import 'dart:async';
import 'dart:math';

import 'package:balloon_game/main.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Balloon extends SpriteComponent with HasGameRef<MyGame>, TapCallbacks {
  late Timer _timer;

  @override
  Future<void> onLoad() async {
    size = Vector2(50, 80);
    _setRandomPosition();
    _timer = Timer(2, onTick: _setRandomPosition, repeat: true);
    sprite = await game.loadSprite('balloon.png');
  }

  @override
  void update(double dt) {
    _timer.update(dt);
  }

  void _setRandomPosition() {
    position =
        Vector2(Random().nextDouble() * 600, Random().nextDouble() * 300);
  }

  @override
  void onTapDown(TapDownEvent event) {
    _setRandomPosition();
    game.increaseScore();
  }
}
