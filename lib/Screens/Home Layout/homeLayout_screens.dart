import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tricare/Cubits/AppCubit/app_cubit.dart';
import 'package:tricare/Screens/Pdf/view_pdf.dart';
import 'package:tricare/Shared/App%20Color/colors.dart';
import 'package:tricare/Shared/Components/Text/text.dart';
import 'package:tricare/Shared/Functions/fucntion.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      body: cubit.screens[cubit.currentIndexBottomNavigationBar],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height*0.08),
        child: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/logo/logo.png',
                  height: width*0.2,
                  width: width*0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),

          centerTitle: true,

        ),
      ),

      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: 5,
        tabBuilder: (index, isActive) {
          final color = isActive ? AppColor.primaryColor : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                cubit.icons[index],
                color: color,
                width: 25,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              BuildText(
                text: cubit.textNavigationBar[index],
                size: 12,

                color: color,
                bold: true,
              ),
            ],
          );
        },
        activeIndex: cubit.currentIndexBottomNavigationBar,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.verySmoothEdge,

        leftCornerRadius: 32,
        rightCornerRadius: 32,
        height: 70,
        onTap: (index) {
          cubit.changeSelectedIndexNav(index);
        },
        //other params
      ),
    );
  },
);
  }
}
