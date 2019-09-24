import 'dart:ffi';
import 'dart:math';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:smack_dot2/test1/smack_game_test.dart';
import 'package:flame/util.dart';
import 'dart:ui';


class SmackGameTest extends BaseGame{
  SlimeTest slimet;
  Size screenSize;
  double tileSizex,tileSizey,x,y;
  int yInc=100;
  Random rnd = new Random();
   
  
  SmackGameTest(Size screenSize){
    tileSizex = screenSize.width / 9 + 150;
    tileSizey = screenSize.width / 9 - 10;
    this.screenSize=size=screenSize;
    this.screenSize=screenSize;
    //init();
    //adding slime
    addSlime();
    
  }
  @override void render(Canvas canvas) {
    super.render(canvas);
  }
  @override void update(double dt) {
    super.update(dt);
    //addSlime();
    final step=dt;
    //this.camera.y-=3;
  }
@override
  void resize(Size size) {
    super.resize(size);
    tileSizex = size.width / 9 + 150;
    tileSizey = size.width / 9 - 10;
    //print(tileSizex);
  }

  void addSlime(){
    x = rnd.nextDouble() * (screenSize.width - tileSizex);
    y = screenSize.height - yInc;
    add(slimet=SlimeTest(this,x,y));
    yInc+=150;
  }

}