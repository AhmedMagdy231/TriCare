import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tricare/Shared/Components/Text/text.dart';

class AimScreens extends StatelessWidget {
  const AimScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Image.asset(
              'assets/images/1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                Colors.black12,
                  Colors.black87,
                ],

              ),
            ),
          ),

          Positioned(

            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  BuildText(
                    text: 'نعمل بشكل تعاوني لارضاء عملائنا عن طريق طرح كافة الاختيارات من خلال منتجاتنا',
                    color: Colors.white,

                    bold: true,
                  ).animate().fadeIn(duration: 400.ms).then(delay: 300.ms),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
