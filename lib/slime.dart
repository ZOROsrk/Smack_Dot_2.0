import 'dart:ui';
//import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:smack_dot2/smack_game.dart';
import 'dart:async';
//import 'package:flame/time.dart';
import 'package:flame/util.dart';
import 'package:flame/position.dart';
import 'package:flame/components/component.dart';

class Slime extends PositionComponent{

  SmackGame game;
   Timer timer;

  Rect slimeRect;
  Paint slimePaint;
  bool toggle = false,isDead=false;
  int i=0;

  Slime(this.game, double x, double y) {
    
  
  //Timer(Duration(seconds: 5),(){
     //game.sList.removeAt(i++);
  //});
    
    slimeRect = Rect.fromLTWH(x, y, game.tileSizex, game.tileSizey); 
    slimePaint = new Paint();
    slimePaint.color = Color(0xff535c68);
    

  }
  @override
  void render(Canvas c) {
    c.drawRect(slimeRect, slimePaint);
  }

  @override
  void update(double t) {
   
    if(!toggle){
      slimeRect = slimeRect.translate(game.tileSizex*t, 0);
      
    
      if(slimeRect.right > game.screenSize.width){
        toggle= true;
      }
    
    }
    if(toggle){
        slimeRect = slimeRect.translate(-game.tileSizex*t, 0);
      
        
        if(slimeRect.left <  0){
          toggle=false;        
        }
          
      }

    //game.camera.y +=10;
      
     
  }
 // void deleteSlime(){
  //  game.sList.removeLast();
  //}

  



}
