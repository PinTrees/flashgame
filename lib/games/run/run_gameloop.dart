
import 'dart:async';
import 'dart:js_interop';
import 'dart:ui';

import 'dart:typed_data';
import 'dart:convert';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart' as m;

import 'package:http/http.dart' as http;

import 'class/player.dart';

class RunGame extends FlameGame
{
  final Player player = Player();

  @override
  void onLoad() async {
    super.onLoad();
    Background bg = Background();
    add(bg);
    add(player);
  }
}


double speed = 16;

class Background extends ParallaxComponent {
  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('run/background/1.png'),
        ParallaxImageData('run/background/2.png'),
        ParallaxImageData('run/background/3.png'),
        ParallaxImageData('run/background/4.png'),
        ParallaxImageData('run/background/5.png'),
      ],
      baseVelocity: Vector2(speed, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );
  }
}





