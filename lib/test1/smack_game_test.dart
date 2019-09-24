import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/components/component.dart';
import 'package:smack_dot2/test1/slime_test.dart';

class SlimeTest extends PositionComponent{
  
  SmackGameTest game;
  static final paint = Paint()..color=Color(0xFFFFFFFF);
 
  SlimeTest(SmackGameTest game,double x,double y){
    this.game=game;
     slimeRect = Rect.fromLTWH(x, y, game.tileSizex, game.tileSizey);
  }
  Rect slimeRect;
  bool toggle = false;

  @override 
  void update(dt){
    
    if(!toggle){
      slimeRect = slimeRect.translate(game.tileSizex*dt, 0);
      
    
      if(slimeRect.right > game.screenSize.width){
        toggle= true;
      }
    
    }
    if(toggle){
        slimeRect = slimeRect.translate(-game.tileSizex*dt, 0);
      
        
        if(slimeRect.left <  0){
          toggle=false;        
        }
          
      }
  }

  @override
  void render(Canvas c){
    setByRect(slimeRect);
    c.drawRect(toRect(), paint);
    
    
  }
}