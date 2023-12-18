import 'package:awesome_icons/awesome_icons.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tricare/Shared/App%20Color/colors.dart';
import 'package:tricare/Shared/Components/Text/text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Cubits/AppCubit/app_cubit.dart';
import '../../Shared/Functions/fucntion.dart';
import '../Pdf/view_pdf.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    
    return   BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [

            BuildSlider(width, height, carouselController, cubit),
            buildAnimatedSmoothIndicator(cubit),
            SizedBox(height: height*0.05,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.02),
              child: Column(
                children: [
                  BuildText(
                      text: 'TRICARE MEDICAL CENTER',
                      bold: true,
                  ).animate().fadeIn(duration: 400.ms).then(delay: 300.ms), // baseline=800ms.scale(),
                  SizedBox(height: height*0.02,),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: BuildText(
                      text: 'Medicine is not only a science ; it is also an art, It dosen\'t consist of compounding pills and plasters , it deals with the very processes of life , which must be understood before they may be guided.',
                      center: true,
                      size: 14,
                    ).animate()
                        .fadeIn(duration: 400.ms)
                        .then(delay: 300.ms) // baseline=800ms
                        .scale(),
                  ),


                  SizedBox(height: height*0.05,),
                 buildRowItem(

                     height: height,
                     width: width,
                     icon: Icons.location_on_sharp,
                     text: 'ONE SEVENTY TOWER, SANT FATIMA SQUARE, MASR EL GDEDA, CAIRO,EGYPT.'.toLowerCase(),
                     function: () async {
                       final availableMaps = await MapLauncher.installedMaps;
                       // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

                       await availableMaps.first.showMarker(
                         coords: Coords(double.parse('30.105751'), double.parse('31.344614')),
                         title: 'Tricare',
                       );
                     },
                 ).animate()
                     .fade(duration: 400.ms)
                     .then(delay: 400.ms) // baseline=800ms
                     .scale(),

                  buildRowItem(

                    height: height,
                    width: width,
                    icon: FontAwesomeIcons.globe,
                    text: 'WWW.TRICARECENTER.COM',
                    function: (){
                      String url = 'https://tricarecenter.com/';
                      final Uri _url = Uri.parse(url);
                      launchUrl(_url, mode: LaunchMode.externalApplication);
                    },
                  ).animate()
                      .fade(duration: 400.ms)
                      .then(delay: 500.ms) // baseline=800ms
                      .scale(),

                  buildRowItem(

                    height: height,
                    width: width,
                    icon: Icons.phone_android,
                    text: '17097',
                    function: (){
                      String url =
                          'tel: 17097';
                      final Uri _url = Uri.parse(url);
                      launchUrl(_url,
                          mode: LaunchMode.externalApplication);
                    },
                  ).animate()
                      .fade(duration: 400.ms)
                      .then(delay: 600.ms) // baseline=800ms
                      .scale(),

                ]
              ),
            ),


          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        child: Icon(Icons.picture_as_pdf,color: Colors.white,),

        onPressed: (){
          navigateTo(context, PDFViewerScreen(pdfPath: 'assets/logo/portofolio_light.pdf'));
        },

      ),

    );
  },
);
  }

  Widget buildRowItem({

    required height,
    required width,
    required icon,
    required text,
    required function,
}) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: height*0.01),
        child: Row(
                      children: [
                        Icon(
                            icon,
                             size: 30,
                        ),
                        SizedBox(width: 10,),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuildText(
                                text: text,
                                size: 12,
                                bold: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
      ),
    );
  }

  Container BuildSlider(double width, double height, CarouselController carouselController, AppCubit cubit) {
    return Container(
      width: width,
      height: height * 0.3,
      child: CarouselSlider.builder(
        carouselController: carouselController,
        itemCount: 4,
        itemBuilder: (context, index, realIndex) {
          return Container(
            width: width*0.9,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                  'assets/images/${(cubit.currentSliderIndex+1).toString()}.jpg',
              fit: BoxFit.fill,
              ),
            ),
          );
        },
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            cubit.changeIndexSlider(index);
          },
          aspectRatio: 16 / 9,
          viewportFraction: 0.99,
          initialPage: cubit.currentSliderIndex,
          enableInfiniteScroll: true,
          //reverse: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
        ),
      ),
    );
  }

  Widget buildAnimatedSmoothIndicator(AppCubit cubit) {
    return Center(
      child: AnimatedSmoothIndicator(
        activeIndex: cubit.currentSliderIndex,
        count: 4,
        effect: WormEffect(
          spacing: 5.0,
          radius: 12.0,
          dotWidth: 10.0,
          dotHeight: 10.0,
          paintStyle: PaintingStyle.fill,
          strokeWidth: 12,
          dotColor: Colors.grey,
          activeDotColor: AppColor.primaryColor,
        ),
      ),
    );
  }
}
