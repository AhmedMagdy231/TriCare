import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricare/Screens/Aim/aim_screens.dart';
import 'package:tricare/Screens/Home/home_screens.dart';
import 'package:tricare/Screens/Services/services.dart';
import 'package:tricare/Screens/Strategy/strategy_screen.dart';
import 'package:tricare/Screens/Vision/vision_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context)=>BlocProvider.of(context);

  int currentIndexBottomNavigationBar = 0;
  int currentSliderIndex = 0;


  List<String> icons = [
    'assets/icons/home.svg',
    'assets/icons/aim.svg',
    'assets/icons/doctor.svg',
    'assets/icons/strategy.svg',
    'assets/icons/services.svg',

  ];

  List<String> textNavigationBar =[
    'الرئسية',
    'الهدف ',
    'الرؤية ',
    'الاستراتيجية',
    'خدماتنا',
  ];

  List<Widget> screens = [
    HomeScreen(),
    AimScreens(),
    VisionScreen(),
    StrategyScreen(),
    ServiceScreen(),


  ];


  void changeSelectedIndexNav(int index){
    currentIndexBottomNavigationBar = index;

    emit(ChangeSelectedIndexNav());

  }

  void changeIndexSlider(int index){
    currentSliderIndex = index;
    emit(ChangeIndexSlider());

  }




}
