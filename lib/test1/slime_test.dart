import 'dart:async' as prefix0;
import 'dart:ffi';
import 'dart:math';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:smack_dot2/test1/smack_game_test.dart';
import 'package:flame/util.dart';
import 'dart:ui';
import 'package:flame/time.dart';

class SmackGameTest extends BaseGame {
  SlimeTest slimet;
  Size screenSize;
  double tileSizex, tileSizey, x, y;
  int yInc = 100,startScroll =0;
  Random rnd = new Random();
  Timer t;
   

  SmackGameTest(Size screenSize) {
    tileSizex = screenSize.width / 9 + 150;
    tileSizey = screenSize.width / 9 - 10;
    this.screenSize = size = screenSize;
    this.screenSize = screenSize;
    //init();
    //adding slime
    t = new Timer(3, callback: () {
      addSlime();
      startScroll++;
    }

    );
    addSlime();
  }
  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    t.update(dt);
    //addSlime();
    //final step=dt;
    if(startScroll>2)
      this.camera.y -= 0.5;
    print(startScroll);  
  }
  
  @override
  void resize(Size size) {
    super.resize(size);
    tileSizex = size.width / 9 + 150;
    tileSizey = size.width / 9 - 10;
    //print(tileSizex);
  }

  void addSlime() {
    x = rnd.nextDouble() * (screenSize.width - tileSizex);
    y = screenSize.height - yInc;
    add(slimet = SlimeTest(this, x, y));
    yInc += 170;
    t.start();
  }
}
