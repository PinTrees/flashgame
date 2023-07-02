
import 'dart:async';
import 'dart:ui';

import 'dart:typed_data';
import 'dart:convert';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart' as m;

import 'package:http/http.dart' as http;

class RunGame extends FlameGame
{
  @override
  void onLoad() async {
    super.onLoad();
    Image img = await getImage("imageUrl");
    final parallaxImage = ParallaxImage(img);

    ParallaxComponent background1 = await loadParallaxComponent(
      [ ],
      baseVelocity: Vector2(10, 0),
      velocityMultiplierDelta: Vector2(1.6, 1.0),
    );

    add(background1);
  }


  Future<Image> getImage(String path) async {
    Completer<m.ImageInfo> completer = Completer();
    var img = new m.NetworkImage(path);
    img.resolve(m.ImageConfiguration()).addListener(m.ImageStreamListener((m.ImageInfo info,bool _){
      completer.complete(info);
    }));
    m.ImageInfo imageInfo = await completer.future;
    return imageInfo.image;
  }
}