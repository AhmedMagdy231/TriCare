
import 'package:flutter/material.dart';
import 'package:tricare/Screens/Home%20Layout/homeLayout_screens.dart';

import '../../Shared/Components/Text/text.dart';
import '../../Shared/Functions/fucntion.dart';




class SplashScreen extends StatefulWidget {
 // final FirstScreen;
//  const SplashScreen({Key? key,required this.FirstScreen}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{

  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.bounceInOut,
    );

    _animationController!.addListener(() {
      if(_animationController!.isCompleted){
        navigateToToFinish(context, HomeLayoutScreen());
     //    Navigator.pushReplacement(
     //        context,
     //        PageRouteBuilder(
     //            transitionDuration: Duration(seconds: 2),
     //            pageBuilder: (_, __, ___) => HomeLayoutScreen()));

      }
    });

    _animationController!.forward();

  }

  @override
  void dispose() {
    _animationController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController!,
          builder: (context,child){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset('assets/logo/logo.png',
                    width: _animation!.value*width*0.7,
                    height: _animation!.value*width*0.7,
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
