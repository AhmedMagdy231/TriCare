import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tricare/Shared/Components/Text/text.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);

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
              //alignment: Alignment.topLeft,
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
                    text: """
             
بسعر إيجار عيادة امتلك عيادتك بمقدم يبدأ من ‎٧٠‏ الف جنيه
العقد تمليك بحصة فى الارض مسجل شهر عقاري
أميز لوكيشن في قلب مصر الجديدة (ميدان سانت فاطيما )
ل مركز طبي مجهز بأحدث الأجهزة الطببه العالمي
السعر شامل الأجهزة وجميع الخدمات الاآتيه
- شركه إداره وتشغيل للمركز
- طاقم تمريض
شركه دعايه واعلان
- غرفة تعقييم
-غرفة نفايات طبيه
- مكيفه بالكامل
- قسم اتصالات وكاميرات مراقب
- إستلام ‎٦‏ شهور
الباقي أقساط متساوية بدون فوايد لمدة تص حتى 5 سنوات
                     """,
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
