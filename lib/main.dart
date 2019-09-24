import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smack_dot2/smack_game.dart';
import 'package:smack_dot2/test1/slime_test.dart';
import 'package:flame/flame.dart';


void main() async{
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp); 
  Size screenSize =await Flame.util.initialDimensions();

  //SmackGame game = new SmackGame();
  SmackGameTest gameTest =  new SmackGameTest(screenSize);
  TapGestureRecognizer tapper = TapGestureRecognizer();
  //tapper.onTapDown = game.onTapDown;
  runApp(gameTest.widget);
  flameUtil.addGestureRecognizer(tapper);
  
}