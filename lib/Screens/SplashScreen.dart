import 'package:days_challange/Screens/HomeScreen.dart';
import 'package:days_challange/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,

      body: AnimationLimiter(

        child: Column(
          children: AnimationConfiguration.toStaggeredList(childAnimationBuilder:
          (widget)=>SlideAnimation(
              verticalOffset: -100,
              child: ScaleAnimation(
            child: widget,
          )), children: [
            SizedBox(height: 80,),
            Image.asset("splash.png")
            ,SizedBox(height: 80,),
            Text("Days Challenge",style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white,fontWeight: FontWeight.w700),),
            SizedBox(height: 80,),

            CupertinoButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Get Started",style: TextStyle(color: secondary),),
                    SizedBox(width: 10,),
                    Icon(Icons.arrow_forward,color: secondary,)
                  ],
                )
                ,color: Colors.white
                , onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(cxt)=>HomeScreen()));
            })
          ]),
        ),
      ),
    );
  }
}
