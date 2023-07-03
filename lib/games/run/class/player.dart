
import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart' as m;

class Player extends SpriteComponent with HasGameRef {
  Player() : super(size: Vector2.all(50));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    Image img = await getImage("https://raw.githubusercontent.com/PinTrees/flashgame/main/.server/run/palyer/punk/Run2.png");
    sprite = Sprite(img);
    position = gameRef.size / 2;
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