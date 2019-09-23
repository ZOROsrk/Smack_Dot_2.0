import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';
import 'package:flame/position.dart';

import 'slime.dart';
import 'dart:math';
import 'dart:async';
class SmackGame extends BaseGame {
  Slime s;
  Position initP = Position.empty();
  Position nextP = Position.fromInts(10, 10);
  double scaler = 10;
  Size screenSize;
  int yInc=100;
  bool movOn = false;
  double tileSizex,tileSizey,x,y;
  List<Slime> sList;
  Random rnd;
  
  SmackGame(){
    initilize();
    //add(s=Slime(this,x,y));
    
  }
  void initilize() async{
    sList = new List<Slime>();
    rnd = new Random();
    resize(await Flame.util.initialDimensions());
    spawnSlime();
  }
 


  @override
  void render(Canvas canvas){
      super.render(canvas);
      //draw background
      Rect bgRect = Rect.fromLTRB(0, 0, screenSize.width,screenSize.height);
      Paint bgPaint = Paint();
      bgPaint.color = Color(0xff011a27);
      canvas.drawRect(bgRect,bgPaint);


      //Paint objPaint = Paint();
      //objPaint.color = Color(0xffe6df44);

      //sList.forEach((Slime slime ){slime.render(canvas);});
      
    //spawnSlime();
  }

  @override
  void update(double t) {
    super.update(t);
    camera.y +=10;
    camera.x +=10;
    //print(camera.y);
    sList.forEach((Slime slime ){slime.update(t);});
    
  }
  
  @override
  void resize(Size size){
      screenSize = size;
      tileSizex= screenSize.width/9+150;
      tileSizey= screenSize.width/9-10;
      super.resize(size);

  }
 
  void spawnSlime(){
    x = rnd.nextDouble() * (screenSize.width - tileSizex);
    y =  screenSize.height - yInc ;
    yInc+=150;
    add(new Slime(this,x,y));
    Timer(Duration(seconds: 2),(){spawnSlime();});
  }
}

